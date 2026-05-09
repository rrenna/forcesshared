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
    public let dauTrend: [DateCountDTO]

    public init(totalDevices: Int,
                byPlatform: [PlatformCountDTO],
                byAppVersion: [VersionCountDTO],
                dauTrend: [DateCountDTO]) {
        self.totalDevices = totalDevices
        self.byPlatform = byPlatform
        self.byAppVersion = byAppVersion
        self.dauTrend = dauTrend
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

public struct DateCountDTO: Codable {
    public let date: Date
    public let count: Int

    public init(date: Date, count: Int) {
        self.date = date
        self.count = count
    }
}
