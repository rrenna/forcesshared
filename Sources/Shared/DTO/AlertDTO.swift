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
    public let repositoryTrackCommits: Bool?
    public let lastParseError: String?
    public let lastParseErrorDate: Date?

    /// When this alert last actually sent a push, as distinct from
    /// `dateLastUpdated` (when its source last changed).
    ///
    /// Only commit-tracking repository alerts rate-limit themselves, and for
    /// those two the values diverge on purpose: notifications are held to at
    /// most one per configured window, so a busy data repo doesn't produce a
    /// push per merge. Without this field a held alert and a broken one look
    /// identical in an admin UI — both just show an old `dateLastUpdated` —
    /// which is the exact ambiguity that let a dead alert go unnoticed for
    /// three months. Surface it wherever `dateLastUpdated` is shown.
    ///
    /// `nil` means "never notified under the throttling scheme": either the
    /// alert has never fired, or it predates the field.
    public let lastNotifiedAt: Date?

    public init(id: UUID?, name: String, value: String?, latestTitle: String?, latestURL: String?, group: String?, dateLastUpdated: Date?, thumbnailURL: String? = nil, headerImageURL: String? = nil, steamGameURL: String? = nil, rssURL: String? = nil, keywords: [String]? = nil, relatedGameSystems: [String]? = nil, repositoryURL: String? = nil, repositoryTrackCommits: Bool? = nil, lastParseError: String? = nil, lastParseErrorDate: Date? = nil, lastNotifiedAt: Date? = nil) {
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
        self.repositoryTrackCommits = repositoryTrackCommits
        self.lastParseError = lastParseError
        self.lastParseErrorDate = lastParseErrorDate
        self.lastNotifiedAt = lastNotifiedAt
    }
}
