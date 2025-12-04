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
    public let thumbnailURL: String?
    public let headerImageURL: String?
    public let steamGameURL: String?
    public let relatedGameSystems: [String]?
    public let repositoryURL: String?

    public init(name: String, value: String, group: String?, rssURL: String, keywords: [String], thumbnailURL: String? = nil, headerImageURL: String? = nil, steamGameURL: String? = nil, relatedGameSystems: [String]? = nil, repositoryURL: String? = nil) {

        self.name = name
        self.value = value
        self.rssURL = rssURL
        self.group = group
        self.keywords = keywords
        self.thumbnailURL = thumbnailURL
        self.headerImageURL = headerImageURL
        self.steamGameURL = steamGameURL
        self.relatedGameSystems = relatedGameSystems
        self.repositoryURL = repositoryURL
    }
}
