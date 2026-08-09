@testable import Shared
import XCTest

final class AlertDTOTests: XCTestCase {

    /// A ForcesAdmin build carrying this field must still decode a response
    /// from a server that predates it. Optional properties get
    /// `decodeIfPresent` from the synthesized decoder, so a missing key is
    /// `nil` rather than a thrown error — pinned here because the app ships
    /// independently of the server and would otherwise show an empty alerts
    /// list rather than degrade gracefully.
    func testDecodesResponseWithoutLastNotifiedAt() throws {
        let json = """
        {
            "name": "Repository data updated for Warhammer The Horus Heresy",
            "value": "Get alerted as soon as the data is updated",
            "latestTitle": "17 data file changes since 7 Aug",
            "latestURL": "https://github.com/BSData/horus-heresy-3rd-edition/compare/aaa...bbb",
            "repositoryURL": "https://github.com/BSData/horus-heresy-3rd-edition",
            "repositoryTrackCommits": true
        }
        """.data(using: .utf8)!

        let alert = try JSONDecoder().decode(AlertDTO.self, from: json)

        XCTAssertNil(alert.lastNotifiedAt)
        XCTAssertEqual(alert.repositoryTrackCommits, true)
        XCTAssertEqual(alert.latestTitle, "17 data file changes since 7 Aug")
    }

    func testDecodesLastNotifiedAtWhenPresent() throws {
        let json = """
        {"name": "A", "lastNotifiedAt": 1770000000}
        """.data(using: .utf8)!

        let alert = try JSONDecoder().decode(AlertDTO.self, from: json)

        XCTAssertEqual(alert.lastNotifiedAt, Date(timeIntervalSinceReferenceDate: 1_770_000_000))
    }

    /// The field is additive: every existing call site omits it and must keep
    /// compiling, landing on nil.
    func testInitDefaultsLastNotifiedAtToNil() {
        let alert = AlertDTO(
            id: nil, name: "A", value: nil, latestTitle: nil, latestURL: nil,
            group: nil, dateLastUpdated: nil
        )
        XCTAssertNil(alert.lastNotifiedAt)
    }
}
