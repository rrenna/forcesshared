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
    /// Coarse-grained platform identifier used for active-user reporting.
    /// Expected values: `ios`, `android`, `macos`, `windows`, `linux`. Optional
    /// for back-compat with older client builds that predate active-user tracking.
    public let platform: String?
    /// User-visible app version (CalVer string like `2026.5.5`). Optional for
    /// back-compat with older clients.
    public let appVersion: String?

    public init(id: UUID? = nil, pushToken: String? = nil, firebasePushToken: String? = nil, osName: String, osVersion: String, channels: [String]? = nil, regionCode: String? = nil, platform: String? = nil, appVersion: String? = nil) {
        self.id = id
        self.pushToken = pushToken
        self.firebasePushToken = firebasePushToken
        self.osName = osName
        self.osVersion = osVersion
        self.channels = channels
        self.regionCode = regionCode
        self.platform = platform
        self.appVersion = appVersion
  }
}
