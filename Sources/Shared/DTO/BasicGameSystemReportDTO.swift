//
//  BasicGameSystemReport.swift
//  
//
//  Created by Ryan Renna on 2022-04-22.
//

import Foundation

public struct BasicGameSystemReportDTO: Codable, Identifiable {

    public var id: String {
        return "\(reportType)-\(gameSystemName)"
    }
    
    public struct ReportItem: Codable
    {
        public let value: Int
        public let hexColor: String?
        
        public init(value: Int, hexColor: String?) {
            self.value = value
            self.hexColor = hexColor
        }
    }
    
    public var reportType: String
    public var gameSystemName: String
    public var date: Date
    public var results: [String: ReportItem]
    public var latestMetaReport: MetaReportDTO?
    public var title: String?

    public init(reportType: String, gameSystemName: String, date: Date, results: [String: ReportItem], latestMetaReport: MetaReportDTO? = nil, title: String? = nil) {

        self.reportType = reportType
        self.gameSystemName = gameSystemName
        self.date = date
        self.results = results
        self.latestMetaReport = latestMetaReport
        self.title = title
    }
}
