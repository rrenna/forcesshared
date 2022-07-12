//
//  UpdateDeviceDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-07.
//

import Foundation

public struct UpdateDeviceDTO: Codable {
    
    public let id: UUID?
    public let pushToken: String?
    public let firebasePushToken: String?
    public var osName: String = "ios"
    public let osVersion: String
    public let channels: [String]?
    public let regionCode: String?

    public init(id: UUID? = nil, pushToken: String? = nil, firebasePushToken: String? = nil, osName: String, osVersion: String, channels: [String]? = nil, regionCode: String? = nil) {
        self.id = id
        self.pushToken = pushToken
        self.firebasePushToken = firebasePushToken
        self.osName = osName
        self.osVersion = osVersion
        self.channels = channels
        self.regionCode = regionCode
  }
}
