//
//  AlertSubscriptionDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-08.
//

import Foundation

public struct AlertSubscriptionDTO: Codable {
    
    public let id: UUID?
    public let deviceid: UUID
    public let alertid: UUID
    
    public init(id: UUID?, deviceid: UUID, alertid: UUID) {
        self.id = id
        self.deviceid = deviceid
        self.alertid = alertid
    }
}
