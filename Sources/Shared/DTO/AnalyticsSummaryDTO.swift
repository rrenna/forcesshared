//
//  AnalyticsSummaryDTO.swift
//
//  Aggregated breakdown of self-hosted analytics events (the Firebase
//  Analytics replacement), returned by `GET /admin/reporting/analytics`
//  (ForcesAdmin) and `GET /portal/data/analytics` (web portal — same
//  underlying `AnalyticsController.summary(_:)` aggregate). Drives the
//  ForcesAdmin Analytics screen's event-volume trend, platform/game-system
//  breakdowns, and per-event table.
//

import Foundation

public struct AnalyticsSummaryDTO: Codable {
    public let eventCounts: [AnalyticsEventCountDTO]
    public let totalEvents: Int
    public let byPlatform: [AnalyticsPlatformCountDTO]
    /// Breakdown of the `game_system` param, wherever an event carries one
    /// (currently just `loaded_roster`). Empty for backends/data predating
    /// the switch away from encoding the variant into the event name.
    public let byGameSystem: [AnalyticsGameSystemCountDTO]
    /// Day-bucketed total event count across the window, for the trend chart.
    public let dailyCounts: [DateCountDTO]
    /// Per-category event totals (server-derived from event name via the
    /// backend's AnalyticsEventCatalog). Nil from servers predating
    /// categorization. Always covers the requested date window only — it is
    /// never narrowed by a `category` filter, so clients can build a stable
    /// category picker from it while a filter is active.
    public let byCategory: [AnalyticsCategoryCountDTO]?

    public init(eventCounts: [AnalyticsEventCountDTO], totalEvents: Int, byPlatform: [AnalyticsPlatformCountDTO], byGameSystem: [AnalyticsGameSystemCountDTO], dailyCounts: [DateCountDTO], byCategory: [AnalyticsCategoryCountDTO]? = nil) {
        self.eventCounts = eventCounts
        self.totalEvents = totalEvents
        self.byPlatform = byPlatform
        self.byGameSystem = byGameSystem
        self.dailyCounts = dailyCounts
        self.byCategory = byCategory
    }
}

public struct AnalyticsEventCountDTO: Codable, Identifiable {
    public let name: String
    public let count: Int
    /// How many distinct devices fired this event at least once, not just
    /// the raw fire count — a retry-loop or a power user can inflate
    /// `count` without this number moving.
    public let uniqueDevices: Int
    /// Server-derived category for this event name (e.g. "ai", "roster").
    /// Nil from servers predating categorization.
    public let category: String?

    public var id: String { name }

    public init(name: String, count: Int, uniqueDevices: Int, category: String? = nil) {
        self.name = name
        self.count = count
        self.uniqueDevices = uniqueDevices
        self.category = category
    }
}

public struct AnalyticsCategoryCountDTO: Codable, Identifiable {
    public let category: String
    public let count: Int
    /// Distinct devices that fired at least one event in this category.
    public let uniqueDevices: Int

    public var id: String { category }

    public init(category: String, count: Int, uniqueDevices: Int) {
        self.category = category
        self.count = count
        self.uniqueDevices = uniqueDevices
    }
}

public struct AnalyticsPlatformCountDTO: Codable, Identifiable {
    public let platform: String
    public let count: Int

    public var id: String { platform }

    public init(platform: String, count: Int) {
        self.platform = platform
        self.count = count
    }
}

public struct AnalyticsGameSystemCountDTO: Codable, Identifiable {
    public let gameSystem: String
    public let count: Int

    public var id: String { gameSystem }

    public init(gameSystem: String, count: Int) {
        self.gameSystem = gameSystem
        self.count = count
    }
}
