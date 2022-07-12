//
//  BasicGameSystemTypeReportDTO.swift.swift
//  
//
//  Created by Ryan Renna on 2022-07-11.
//

import Foundation

public struct BasicGameSystemTypeReportDTO: Codable {
    
    public var unitMetaStats: [UnitMetaStatDTO]

    public init(unitMetaStats: [UnitMetaStatDTO]) {
        
        self.unitMetaStats = unitMetaStats
    }
}
