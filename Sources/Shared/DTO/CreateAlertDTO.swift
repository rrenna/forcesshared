//
//  File.swift
//  
//
//  Created by Ryan Renna on 2022-05-19.
//

import Foundation

public struct CreateAlertDTO: Codable {

    public let name: String
    public let group: String?
    public let rssURL: String
    public let keywords: [String]
    
    public init(name: String,  group: String?, rssURL: String, keywords: [String]) {
        
        self.name = name
        self.rssURL = rssURL
        self.group = group
        self.keywords = keywords
    }
}
