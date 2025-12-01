//
//  ThumbnailResultDTO.swift
//
//
//  Created by Ryan Renna on 2025-11-30.
//

import Foundation

public struct ThumbnailResultDTO: Codable, Identifiable {

    public let id: String?
    public let unitName: String
    public let catalogueName: String?
    public let gameSystemId: String
    public let imageUrl: String?
    public let indexedDate: String?

    public init(id: String?, unitName: String, catalogueName: String?, gameSystemId: String, imageUrl: String?, indexedDate: String?) {
        self.id = id
        self.unitName = unitName
        self.catalogueName = catalogueName
        self.gameSystemId = gameSystemId
        self.imageUrl = imageUrl
        self.indexedDate = indexedDate
    }
}
