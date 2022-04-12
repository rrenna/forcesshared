//
//  ReportArmyDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-11.
//

import Foundation

public struct ReportArmyDTO: Codable {
    
    public var name: String
    public var deviceid: UUID
    public var gameSystemName: String
    public var userInfo: [String: String]
    
    public init(name: String, deviceid: UUID, gameSystemName: String, userInfo: [String : String]) {
        self.name = name
        self.deviceid = deviceid
        self.gameSystemName = gameSystemName
        self.userInfo = userInfo
    }
}
