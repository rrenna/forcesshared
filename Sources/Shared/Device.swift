//
//  Device.swift
//  
//
//  Created by Ryan Renna on 2022-04-07.
//

import Foundation

public struct Device: Codable {

  public let id: UUID
  public var osVersion: String
  public var pushToken: String?
  public var channels: [String]

  public init(id: UUID, osVersion: String, pushToken: String?, channels: [String]) {
    self.id = id
    self.osVersion = osVersion
    self.pushToken = pushToken
    self.channels = channels
  }
}
