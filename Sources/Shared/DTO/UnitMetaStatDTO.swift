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
    public var medianAmount: Float
    public var mostCommonAmount: Float
    public var catalogues: [String]?

    public init(name: String, percentOfArmiesContaining: Float, meanAmount: Float, medianAmount: Float, mostCommonAmount: Float, catalogues: [String]? = nil) {
        self.name = name
        self.percentOfArmiesContaining = percentOfArmiesContaining
        self.meanAmount = meanAmount
        self.medianAmount = medianAmount
        self.mostCommonAmount = mostCommonAmount
        self.catalogues = catalogues
    }
}
