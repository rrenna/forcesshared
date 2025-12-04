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
    public let dateLastUpdated: Date?
    public let thumbnailURL: String?
    public let headerImageURL: String?
    public let steamGameURL: String?
    public let rssURL: String?
    public let keywords: [String]?
    public let relatedGameSystems: [String]?
    public let repositoryURL: String?

    public init(id: UUID?, name: String, value: String?, latestTitle: String?, latestURL: String?, group: String?, dateLastUpdated: Date?, thumbnailURL: String? = nil, headerImageURL: String? = nil, steamGameURL: String? = nil, rssURL: String? = nil, keywords: [String]? = nil, relatedGameSystems: [String]? = nil, repositoryURL: String? = nil) {
        self.id = id
        self.name = name
        self.value = value
        self.latestTitle = latestTitle
        self.latestURL = latestURL
        self.group = group
        self.dateLastUpdated = dateLastUpdated
        self.thumbnailURL = thumbnailURL
        self.headerImageURL = headerImageURL
        self.steamGameURL = steamGameURL
        self.rssURL = rssURL
        self.keywords = keywords
        self.relatedGameSystems = relatedGameSystems
        self.repositoryURL = repositoryURL
    }
}
