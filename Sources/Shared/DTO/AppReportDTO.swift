//
//  File.swift
//  
//
//  Created by Ryan Renna on 2022-08-16.
//

import Foundation

public struct AppReportDTO: Codable {

    public let totalNumberOfArmiesReported: Int
    
    public init(totalNumberOfArmiesReported: Int) {
        
        self.totalNumberOfArmiesReported = totalNumberOfArmiesReported
    }
}

