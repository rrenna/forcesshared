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
  public let osVersion: String
  public let channels: [String]?

  public init(id: UUID? = nil, pushToken: String? = nil, osVersion: String, channels: [String]? = nil) {
      
    self.id = id
    self.pushToken = pushToken
    self.osVersion = osVersion
    self.channels = channels
  }
}
