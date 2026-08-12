@testable import Shared
import XCTest

final class AnalyticsSummaryDTOTests: XCTestCase {

    /// A ForcesAdmin build carrying `byCategory`/`category` must still decode
    /// a response from a server that predates event categorization. Optional
    /// properties get `decodeIfPresent` from the synthesized decoder, so the
    /// missing keys are `nil` rather than a thrown error — pinned here
    /// because the app ships independently of the server.
    func testDecodesResponseWithoutCategoryFields() throws {
        let json = """
        {
            "eventCounts": [
                { "name": "loaded_roster", "count": 12, "uniqueDevices": 4 }
            ],
            "totalEvents": 12,
            "byPlatform": [ { "platform": "ios", "count": 12 } ],
            "byGameSystem": [],
            "dailyCounts": []
        }
        """.data(using: .utf8)!

        let summary = try JSONDecoder().decode(AnalyticsSummaryDTO.self, from: json)

        XCTAssertNil(summary.byCategory)
        XCTAssertEqual(summary.eventCounts.first?.name, "loaded_roster")
        XCTAssertNil(summary.eventCounts.first?.category)
    }

    func testDecodesResponseWithCategoryFields() throws {
        let json = """
        {
            "eventCounts": [
                { "name": "ai_notes_generated", "count": 3, "uniqueDevices": 2, "category": "ai" }
            ],
            "totalEvents": 3,
            "byPlatform": [],
            "byGameSystem": [],
            "dailyCounts": [],
            "byCategory": [ { "category": "ai", "count": 3, "uniqueDevices": 2 } ]
        }
        """.data(using: .utf8)!

        let summary = try JSONDecoder().decode(AnalyticsSummaryDTO.self, from: json)

        XCTAssertEqual(summary.byCategory?.count, 1)
        XCTAssertEqual(summary.byCategory?.first?.category, "ai")
        XCTAssertEqual(summary.byCategory?.first?.uniqueDevices, 2)
        XCTAssertEqual(summary.eventCounts.first?.category, "ai")
    }
}
