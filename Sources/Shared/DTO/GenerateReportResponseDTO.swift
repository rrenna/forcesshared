//
//  GenerateReportResponseDTO.swift
//
//
//  Created by Ryan Renna on 2025-12-11.
//

import Foundation

public struct GenerateReportResponseDTO: Codable {
    public let success: Bool
    public let message: String
    public let startDate: String
    public let endDate: String

    public init(success: Bool, message: String, startDate: String, endDate: String) {
        self.success = success
        self.message = message
        self.startDate = startDate
        self.endDate = endDate
    }
}
