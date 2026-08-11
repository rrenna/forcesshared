//
//  AnalyticsVersionCompareDTO.swift
//
//  Version-over-version comparison of self-hosted analytics events,
//  returned by `GET /admin/reporting/analytics/version-compare` (ForcesAdmin)
//  and `GET /portal/data/analytics/version-compare` (web portal). Per-event
//  rates are normalized to events-per-unique-device on each version, so the
//  delta measures behavior change rather than adoption size.
//
//  `AnalyticsVersionDTO` (from the sibling `/versions` endpoints) lists
//  every app version seen in the events table, for populating version
//  pickers. Timestamps are epoch millis — unambiguous for both JS
//  (`new Date(n)`) and Swift, independent of any JSON date strategy.
//

import Foundation

public struct AnalyticsVersionDTO: Codable, Identifiable {
    public let version: String
    /// Distinct devices that reported any event on this version.
    public let devices: Int
    public let events: Int
    public let firstSeenMillis: Int
    public let lastSeenMillis: Int

    public var id: String { version }

    public init(version: String, devices: Int, events: Int, firstSeenMillis: Int, lastSeenMillis: Int) {
        self.version = version
        self.devices = devices
        self.events = events
        self.firstSeenMillis = firstSeenMillis
        self.lastSeenMillis = lastSeenMillis
    }
}

public struct AnalyticsVersionCompareSideDTO: Codable {
    public let version: String
    public let devices: Int
    public let events: Int
    /// nil when the requested version has no events at all.
    public let firstSeenMillis: Int?
    public let lastSeenMillis: Int?

    public init(version: String, devices: Int, events: Int, firstSeenMillis: Int?, lastSeenMillis: Int?) {
        self.version = version
        self.devices = devices
        self.events = events
        self.firstSeenMillis = firstSeenMillis
        self.lastSeenMillis = lastSeenMillis
    }
}

public struct AnalyticsVersionCompareRowDTO: Codable, Identifiable {
    public let name: String
    /// nil = event never fired on that version — the new/removed-event
    /// signal (shipped or regressed analytics wiring).
    public let fromCount: Int?
    /// Events per unique device on the `from` version.
    public let fromRate: Double?
    public let toCount: Int?
    public let toRate: Double?
    /// Percent change in per-device rate, `to` relative to `from`; nil when
    /// the event is missing on either side.
    public let deltaPercent: Double?

    public var id: String { name }

    public init(name: String, fromCount: Int?, fromRate: Double?, toCount: Int?, toRate: Double?, deltaPercent: Double?) {
        self.name = name
        self.fromCount = fromCount
        self.fromRate = fromRate
        self.toCount = toCount
        self.toRate = toRate
        self.deltaPercent = deltaPercent
    }
}

public struct AnalyticsVersionCompareDTO: Codable {
    public let from: AnalyticsVersionCompareSideDTO
    public let to: AnalyticsVersionCompareSideDTO
    /// Sorted most-notable first: new/removed events (by volume), then by
    /// absolute delta.
    public let rows: [AnalyticsVersionCompareRowDTO]

    public init(from: AnalyticsVersionCompareSideDTO, to: AnalyticsVersionCompareSideDTO, rows: [AnalyticsVersionCompareRowDTO]) {
        self.from = from
        self.to = to
        self.rows = rows
    }
}
