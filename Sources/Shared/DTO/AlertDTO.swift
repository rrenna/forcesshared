//
//  AlertDTO.swift
//  
//
//  Created by Ryan Renna on 2022-04-07.
//

import Foundation

public struct AlertDTO: Codable {

    public let id: UUID?
    public let name: String
    public let latestTitle: String?
    public let latestURL: String?
    
    public init(id: UUID?, name: String, latestTitle: String?, latestURL: String?) {
        self.id = id
        self.name = name
        self.latestTitle = latestTitle
        self.latestURL = latestURL
    }
}
