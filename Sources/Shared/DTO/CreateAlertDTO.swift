//
//  File.swift
//  
//
//  Created by Ryan Renna on 2022-05-19.
//

import Foundation

public struct CreateAlertDTO: Codable {

    public let name: String
    public let value: String
    public let group: String?
    public let rssURL: String
    public let keywords: [String]
    
    public init(name: String, value: String, group: String?, rssURL: String, keywords: [String]) {
        
        self.name = name
        self.value = value
        self.rssURL = rssURL
        self.group = group
        self.keywords = keywords
    }
}
