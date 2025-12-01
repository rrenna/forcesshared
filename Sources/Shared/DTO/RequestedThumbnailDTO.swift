//
//  RequestedThumbnailDTO.swift
//
//
//  Created by Ryan Renna on 2025-12-01.
//

import Foundation

public struct RequestedThumbnailDTO: Codable, Identifiable {

    public let id: String?
    public let unitName: String
    public let catalogueName: String?
    public let gameSystemId: String
    public let requestCount: Int
    public let firstRequestedAt: String?
    public let lastRequestedAt: String?

    public init(id: String?, unitName: String, catalogueName: String?, gameSystemId: String, requestCount: Int, firstRequestedAt: String?, lastRequestedAt: String?) {
        self.id = id
        self.unitName = unitName
        self.catalogueName = catalogueName
        self.gameSystemId = gameSystemId
        self.requestCount = requestCount
        self.firstRequestedAt = firstRequestedAt
        self.lastRequestedAt = lastRequestedAt
    }
}
