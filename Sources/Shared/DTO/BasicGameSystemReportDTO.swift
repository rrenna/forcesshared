//
//  BasicGameSystemReport.swift
//  
//
//  Created by Ryan Renna on 2022-04-22.
//

import Foundation

public struct BasicGameSystemReport: Codable {
    
    public var reportType: String
    public var gameSystemName: String
    public var date: Date
    public var results: [String: Int]
    
    public init(reportType: String, gameSystemName: String, date: Date, results: [String : Int]) {
        
        self.reportType = reportType
        self.gameSystemName = gameSystemName
        self.date = date
        self.results = results
    }
}
