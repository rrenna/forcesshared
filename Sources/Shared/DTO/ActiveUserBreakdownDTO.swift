//
//  ActiveUserBreakdownDTO.swift
//
//  Detailed active-user breakdown returned by `GET /admin/reporting/active-users`.
//  Drives the ForcesAdmin charts screen (DAU trend, per-platform mix, top app
//  versions). Sourced from `DeviceDBO.lastSeen` heartbeats fired by every
//  client on app launch.
//

import Foundation

public struct ActiveUserBreakdownDTO: Codable {
    public let totalDevices: Int
    public let byPlatform: [PlatformCountDTO]
    public let byAppVersion: [VersionCountDTO]
    /// Per-platform-per-version breakdown — drives the stacked "By App
    /// Version" chart in ForcesAdmin so you can see e.g. how many iOS vs
    /// Android vs macOS installs are on each version. Sorted by total count
    /// per version (descending), then by platform for stable stacking. Capped
    /// to keep the chart readable; older long-tail versions are dropped.
    /// Optional in the wire format so older deployed backends (which omit
    /// the key entirely) still decode — falls back to `[]` via the custom
    /// `init(from:)` below.
    public let byPlatformVersion: [PlatformVersionCountDTO]
    public let dauTrend: [DateCountDTO]

    public init(totalDevices: Int,
                byPlatform: [PlatformCountDTO],
                byAppVersion: [VersionCountDTO],
                byPlatformVersion: [PlatformVersionCountDTO] = [],
                dauTrend: [DateCountDTO]) {
        self.totalDevices = totalDevices
        self.byPlatform = byPlatform
        self.byAppVersion = byAppVersion
        self.byPlatformVersion = byPlatformVersion
        self.dauTrend = dauTrend
    }

    private enum CodingKeys: String, CodingKey {
        case totalDevices, byPlatform, byAppVersion, byPlatformVersion, dauTrend
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.totalDevices = try c.decode(Int.self, forKey: .totalDevices)
        self.byPlatform = try c.decode([PlatformCountDTO].self, forKey: .byPlatform)
        self.byAppVersion = try c.decode([VersionCountDTO].self, forKey: .byAppVersion)
        // Older backends predate this field — default to empty so the client
        // still functions and renders the legacy flat-version chart instead.
        self.byPlatformVersion = (try c.decodeIfPresent([PlatformVersionCountDTO].self, forKey: .byPlatformVersion)) ?? []
        self.dauTrend = try c.decode([DateCountDTO].self, forKey: .dauTrend)
    }
}

public struct PlatformCountDTO: Codable {
    /// Raw platform key (`ios`, `android`, `macos`, `windows`, `linux`).
    public let platform: String
    /// User-facing label (`iOS`, `Android`, ...).
    public let label: String
    public let count: Int

    public init(platform: String, label: String, count: Int) {
        self.platform = platform
        self.label = label
        self.count = count
    }
}

public struct VersionCountDTO: Codable {
    public let version: String
    public let count: Int

    public init(version: String, count: Int) {
        self.version = version
        self.count = count
    }
}

public struct PlatformVersionCountDTO: Codable, Identifiable {
    /// Raw platform key (`ios`, `android`, `macos`, `windows`, `linux`).
    public let platform: String
    /// User-facing platform label (`iOS`, `Android`, ...).
    public let platformLabel: String
    public let version: String
    public let count: Int

    /// Stable identity for SwiftUI lists / Swift Charts. Each
    /// `(platform, version)` pair is unique within a breakdown response, so
    /// concatenating with a separator the version string can't contain
    /// produces a deterministic id without an extra encoded field.
    public var id: String { "\(platform)|\(version)" }

    public init(platform: String, platformLabel: String, version: String, count: Int) {
        self.platform = platform
        self.platformLabel = platformLabel
        self.version = version
        self.count = count
    }
}

public struct DateCountDTO: Codable {
    public let date: Date
    public let count: Int

    public init(date: Date, count: Int) {
        self.date = date
        self.count = count
    }
}
