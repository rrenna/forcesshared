//
//  UpdateAlertDTO.swift
//
//
//  Created by Ryan Renna on 2025-12-03.
//

import Foundation

public struct UpdateAlertDTO: Codable {

    public let name: String?
    public let value: String?
    public let group: String?
    public let rssURL: String?
    public let keywords: [String]?
    public let thumbnailURL: String?
    public let headerImageURL: String?
    public let steamGameURL: String?
    public let relatedGameSystems: [String]?
    public let repositoryURL: String?

    public init(name: String? = nil, value: String? = nil, group: String? = nil, rssURL: String? = nil, keywords: [String]? = nil, thumbnailURL: String? = nil, headerImageURL: String? = nil, steamGameURL: String? = nil, relatedGameSystems: [String]? = nil, repositoryURL: String? = nil) {
        self.name = name
        self.value = value
        self.group = group
        self.rssURL = rssURL
        self.keywords = keywords
        self.thumbnailURL = thumbnailURL
        self.headerImageURL = headerImageURL
        self.steamGameURL = steamGameURL
        self.relatedGameSystems = relatedGameSystems
        self.repositoryURL = repositoryURL
    }
}
