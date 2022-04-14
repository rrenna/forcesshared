//
//  ReportArmyDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-11.
//

import Foundation

public struct ReportArmyDTO: Codable {
    
    public var name: String
    public var reporteruuid: UUID // A unique identifier for the reporter
    public var deviceid: UUID? // Optional link to the device
    public var source: String?
    public var gameSystemName: String
    public var metadata: [String: String]
    
    public init(name: String, reporteruuid: UUID, deviceid: UUID?, source: String?, gameSystemName: String, metadata: [String : String]) {
        self.name = name
        self.reporteruuid = reporteruuid
        self.deviceid = deviceid
        self.source = source
        self.gameSystemName = gameSystemName
        self.metadata = metadata
    }
}
