//
//  AppReportDTO.swift
//
//
//  Created by Ryan Renna on 2022-08-16.
//

import Foundation

public struct StatItemDTO: Codable {
    public let label: String
    public let value: String
    public let icon: String?

    public init(label: String, value: String, icon: String? = nil) {
        self.label = label
        self.value = value
        self.icon = icon
    }
}

public struct StatGroupDTO: Codable {
    public let title: String
    public let items: [StatItemDTO]

    public init(title: String, items: [StatItemDTO]) {
        self.title = title
        self.items = items
    }
}

public struct AppReportDTO: Codable {

    // Legacy field for backwards compatibility
    public let totalNumberOfArmiesReported: Int

    // Flexible stats grouped by category
    public let statGroups: [StatGroupDTO]?

    public init(totalNumberOfArmiesReported: Int, statGroups: [StatGroupDTO]? = nil) {
        self.totalNumberOfArmiesReported = totalNumberOfArmiesReported
        self.statGroups = statGroups
    }
}

