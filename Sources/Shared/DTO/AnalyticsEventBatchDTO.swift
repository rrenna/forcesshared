//
//  AnalyticsEventBatchDTO.swift
//
//  Created by Ryan Renna on 2026-08-10.
//

import Foundation

/// Batch of queued analytics events flushed together — see
/// `AnalyticsService.flushPending` on the client. Sent to
/// `POST /api/analytics/events/batch`.
public struct AnalyticsEventBatchDTO: Codable {

    public let events: [AnalyticsEventDTO]

    public init(events: [AnalyticsEventDTO]) {
        self.events = events
    }
}
