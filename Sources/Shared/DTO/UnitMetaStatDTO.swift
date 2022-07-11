//
//  UnitMetaStatDTO.swift
//  
//
//  Created by Ryan Renna on 2022-07-10.
//

import Foundation

public struct UnitMetaStatDTO: Codable {
   
    public var name: String
    public var percentOfArmiesContaining: Float
    public var meanAmount: Float
    public var mediumAmount: Float
    public var mostCommonAmount: Float
    
    public init(name: String, percentOfArmiesContaining: Float, meanAmount: Float, mediumAmount: Float, mostCommonAmount: Float) {
        self.name = name
        self.percentOfArmiesContaining = percentOfArmiesContaining
        self.meanAmount = meanAmount
        self.mediumAmount = mediumAmount
        self.mostCommonAmount = mostCommonAmount
    }
}
