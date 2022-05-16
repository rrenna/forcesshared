//
//  AlertDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-07.
//

import Foundation

public struct AlertDTO: Codable, Identifiable {

    public let id: UUID?
    public let name: String
    public let value: String?
    public let latestTitle: String?
    public let latestURL: String?
    public let group: String?
    
    public init(id: UUID?, name: String, value: String?, latestTitle: String?, latestURL: String?, group: String?) {
        self.id = id
        self.name = name
        self.value = value
        self.latestTitle = latestTitle
        self.latestURL = latestURL
        self.group = group
    }
}
