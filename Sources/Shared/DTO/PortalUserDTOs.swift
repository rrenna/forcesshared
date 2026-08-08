//
//  PortalUserDTOs.swift
//  Shared
//
//  Read-path shapes for the admin user screens, shared by the web portal
//  (/portal/data/users) and ForcesAdmin (/admin/users).
//
//  Read-only by design. The mutating operations these screens also expose
//  in the portal — granting admin, assigning benefit plans, linking
//  RevenueCat ids, deleting accounts — are deliberately NOT represented
//  here: they stay portal-only, where the ability tiers that guard them
//  (portal.access.benefits, PortalAdminOnlyMiddleware) actually exist.
//
//  Names keep their `Portal` prefix because that's the established
//  vocabulary in forcesweb; moving them here was a move, not a rename.
//
//  Vapor's `Content` conformance is added server-side so this package
//  stays Vapor-free.
//

import Foundation

/// One row of the admin users list.
public struct PortalUserRow: Codable, Sendable, Identifiable {
    public let id: String
    public let email: String
    public let displayName: String?
    public let avatarURL: String?
    public let isAdmin: Bool
    /// Actually `UserModel.updatedAt` — there's no distinct last-login
    /// timestamp yet, so this is a rough proxy.
    public let lastLoginAt: Date?
    /// Effective abilities for this user's role.
    public let abilityKeys: [String]
    /// Federated identity providers linked to this account (e.g. `["google",
    /// "apple"]`). Empty for accounts that only have an email identifier.
    public let linkedProviders: [String]
    /// True when any linked RevenueCat id holds a live Forces Pro
    /// entitlement. Necessarily false for users with no linked ids —
    /// "no badge" means "not linked or not subscribed", never proof of
    /// neither.
    public let hasPro: Bool

    public init(
        id: String,
        email: String,
        displayName: String? = nil,
        avatarURL: String? = nil,
        isAdmin: Bool,
        lastLoginAt: Date? = nil,
        abilityKeys: [String] = [],
        linkedProviders: [String] = [],
        hasPro: Bool = false
    ) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.avatarURL = avatarURL
        self.isAdmin = isAdmin
        self.lastLoginAt = lastLoginAt
        self.abilityKeys = abilityKeys
        self.linkedProviders = linkedProviders
        self.hasPro = hasPro
    }
}

/// Activity counters for one user, shown on the detail screen.
public struct PortalUserStatsDTO: Codable, Sendable {
    public let reportedArmyCount: Int
    public let gameSystemBreakdown: [String: Int]
    public let lastReportedAt: Date?
    public let deviceCount: Int
    /// Devices grouped by platform (e.g. "ios", "android", "macos"). A
    /// null/empty platform is bucketed under "unknown" rather than dropped,
    /// so `deviceCount` always equals the sum of these values.
    public let devicesByPlatform: [String: Int]

    public init(
        reportedArmyCount: Int,
        gameSystemBreakdown: [String: Int],
        lastReportedAt: Date? = nil,
        deviceCount: Int,
        devicesByPlatform: [String: Int]
    ) {
        self.reportedArmyCount = reportedArmyCount
        self.gameSystemBreakdown = gameSystemBreakdown
        self.lastReportedAt = lastReportedAt
        self.deviceCount = deviceCount
        self.devicesByPlatform = devicesByPlatform
    }
}

/// Roster-storage plan and Forces Pro status for one user.
public struct PortalUserBenefitsDTO: Codable, Sendable {
    public let planKey: String
    public let planName: String
    public let rosterStorageLimit: Int
    public let rosterStorageUsed: Int
    /// True iff the user has an explicit plan set on their profile, vs.
    /// falling back to the computed pro plan or the default.
    public let isExplicitAssignment: Bool
    /// Forces Pro status computed from the user's linked RevenueCat ids.
    public let proActive: Bool
    public let proExpiresAt: Date?
    public let proStore: String?
    public let linkedRevenueCatIDs: [PortalLinkedRCIDDTO]

    public init(
        planKey: String,
        planName: String,
        rosterStorageLimit: Int,
        rosterStorageUsed: Int,
        isExplicitAssignment: Bool,
        proActive: Bool,
        proExpiresAt: Date? = nil,
        proStore: String? = nil,
        linkedRevenueCatIDs: [PortalLinkedRCIDDTO] = []
    ) {
        self.planKey = planKey
        self.planName = planName
        self.rosterStorageLimit = rosterStorageLimit
        self.rosterStorageUsed = rosterStorageUsed
        self.isExplicitAssignment = isExplicitAssignment
        self.proActive = proActive
        self.proExpiresAt = proExpiresAt
        self.proStore = proStore
        self.linkedRevenueCatIDs = linkedRevenueCatIDs
    }
}

/// One linked RevenueCat customer. `rcAppUserID` is shown to admins for
/// cross-lookup in the RevenueCat dashboard.
public struct PortalLinkedRCIDDTO: Codable, Sendable, Identifiable {
    public var id: String { rcAppUserID }

    public let rcAppUserID: String
    public let platform: String
    public let store: String?
    public let proActive: Bool
    public let proExpiresAt: Date?
    public let lastVerifiedAt: Date

    public init(
        rcAppUserID: String,
        platform: String,
        store: String? = nil,
        proActive: Bool,
        proExpiresAt: Date? = nil,
        lastVerifiedAt: Date
    ) {
        self.rcAppUserID = rcAppUserID
        self.platform = platform
        self.store = store
        self.proActive = proActive
        self.proExpiresAt = proExpiresAt
        self.lastVerifiedAt = lastVerifiedAt
    }
}
