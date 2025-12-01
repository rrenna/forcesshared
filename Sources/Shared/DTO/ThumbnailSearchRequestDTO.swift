//
//  ThumbnailSearchRequestDTO.swift
//
//
//  Created by Ryan Renna on 2025-12-01.
//

import Foundation

public struct ThumbnailSearchRequestDTO: Codable {

    public let requests: [ThumbnailUnitRequestDTO]

    public init(requests: [ThumbnailUnitRequestDTO]) {
        self.requests = requests
    }
}

public struct ThumbnailUnitRequestDTO: Codable {

    public let unitName: String
    public let catalogueName: String?
    public let gameSystemId: String

    public init(unitName: String, catalogueName: String?, gameSystemId: String) {
        self.unitName = unitName
        self.catalogueName = catalogueName
        self.gameSystemId = gameSystemId
    }
}
