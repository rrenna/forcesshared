//
//  AnalyticsEventDTO.swift
//
//  Created by Ryan Renna on 2026-08-10.
//

import Foundation

/// A single client-reported analytics event. Replaces Firebase Analytics —
/// sent to `POST /api/analytics/events` and persisted server-side for
/// display on the `/portal` dashboard.
public struct AnalyticsEventDTO: Codable {

    public let deviceId: String?
    public let name: String
    /// Arbitrary string-keyed params (mirrors Firebase's `parameters: [String: Any]`,
    /// narrowed to String values since that's all existing call sites ever sent).
    public let params: [String: String]?
    public let platform: String
    public let appVersion: String?
    /// Epoch milliseconds, client-stamped so offline/delayed delivery doesn't skew ordering.
    public let occurredAt: Int64

    public init(deviceId: String? = nil, name: String, params: [String: String]? = nil, platform: String, appVersion: String? = nil, occurredAt: Int64) {
        self.deviceId = deviceId
        self.name = name
        self.params = params
        self.platform = platform
        self.appVersion = appVersion
        self.occurredAt = occurredAt
    }
}
