//
//  UnitLoadoutOptionDTO.swift
//
//
//  Created by Ryan Renna on 2026-07-11.
//

import Foundation

/// A wargear/weapon/enhancement option chosen for a unit, with how often
/// armies fielding that unit picked it. Attached to `UnitMetaStatDTO.topLoadouts`.
public struct UnitLoadoutOptionDTO: Codable {

    public var name: String
    /// Fraction of armies containing the parent unit that chose this option (0...1).
    public var percentOfArmiesWithUnit: Float

    public init(name: String, percentOfArmiesWithUnit: Float) {
        self.name = name
        self.percentOfArmiesWithUnit = percentOfArmiesWithUnit
    }
}
