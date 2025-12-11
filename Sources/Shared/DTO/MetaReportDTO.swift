//
//  MetaReportDTO.swift
//
//
//  Created by Ryan Renna on 2025-12-10.
//

import Foundation

public struct MetaReportDTO: Codable {

    public let id: UUID
    public let date: Date
    public let dateRangeStart: Date
    public let dateRangeEnd: Date
    public let body: String
    public let gameSystemName: String

    public init(id: UUID, date: Date, dateRangeStart: Date, dateRangeEnd: Date, body: String, gameSystemName: String) {
        self.id = id
        self.date = date
        self.dateRangeStart = dateRangeStart
        self.dateRangeEnd = dateRangeEnd
        self.body = body
        self.gameSystemName = gameSystemName
    }
}
