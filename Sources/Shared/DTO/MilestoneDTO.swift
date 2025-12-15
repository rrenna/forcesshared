//
//  MilestoneDTO.swift
//
//
//  Created by Claude on 2025-12-15.
//

import Foundation

public struct MilestoneDTO: Codable, Identifiable {
    public var id: UUID?
    public var name: String
    public var body: String
    public var date: Date
    public var gameSystemName: String?
    public var thumbnailURL: String?
    public var url: String?

    public init(id: UUID? = nil, name: String, body: String, date: Date, gameSystemName: String? = nil, thumbnailURL: String? = nil, url: String? = nil) {
        self.id = id
        self.name = name
        self.body = body
        self.date = date
        self.gameSystemName = gameSystemName
        self.thumbnailURL = thumbnailURL
        self.url = url
    }
}

public struct CreateMilestoneDTO: Codable {
    public var name: String
    public var body: String
    public var date: Date
    public var gameSystemName: String?
    public var thumbnailURL: String?
    public var url: String?

    public init(name: String, body: String, date: Date, gameSystemName: String? = nil, thumbnailURL: String? = nil, url: String? = nil) {
        self.name = name
        self.body = body
        self.date = date
        self.gameSystemName = gameSystemName
        self.thumbnailURL = thumbnailURL
        self.url = url
    }
}

public struct UpdateMilestoneDTO: Codable {
    public var name: String?
    public var body: String?
    public var date: Date?
    public var gameSystemName: String?
    public var thumbnailURL: String?
    public var url: String?

    public init(name: String? = nil, body: String? = nil, date: Date? = nil, gameSystemName: String? = nil, thumbnailURL: String? = nil, url: String? = nil) {
        self.name = name
        self.body = body
        self.date = date
        self.gameSystemName = gameSystemName
        self.thumbnailURL = thumbnailURL
        self.url = url
    }
}
