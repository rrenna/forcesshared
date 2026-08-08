//
//  MilestonesJobStatusDTO.swift
//  Shared
//
//  Last-run + live progress status for the server's MilestonesScanJob.
//  Lives here rather than server-side so ForcesAdmin decodes the same type
//  the server encodes, the way MilestoneDTO already does.
//
//  Vapor's `Content` conformance is added server-side (`extension
//  MilestonesJobStatusDTO: Content {}`) so this package stays Vapor-free.
//

import Foundation

public struct MilestonesJobStatusDTO: Codable {

    public enum State: String, Codable {
        case idle
        case running
        case completed
        case failed
    }

    /// How this run was started — the portal/admin "Run Now" button, or the
    /// daily scheduled pass.
    public enum Trigger: String, Codable {
        case scheduled
        case manual
    }

    public var state: State
    public var trigger: Trigger
    public var startedAt: Date?
    public var finishedAt: Date?
    public var updatedAt: Date
    public var errorMessage: String?

    /// Raw articles pulled from the WHC homepage this run, before dedupe.
    public var articlesScanned: Int
    /// Articles that survived dedupe and were judged individually —
    /// `articlesScanned` minus ones already known from a prior run.
    public var candidatesJudged: Int
    /// Judged candidates written as `pending` (worthy, not a duplicate) —
    /// what actually needs review.
    public var newPendingCandidates: Int

    public init(
        state: State,
        trigger: Trigger,
        startedAt: Date? = nil,
        finishedAt: Date? = nil,
        updatedAt: Date,
        errorMessage: String? = nil,
        articlesScanned: Int = 0,
        candidatesJudged: Int = 0,
        newPendingCandidates: Int = 0
    ) {
        self.state = state
        self.trigger = trigger
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.updatedAt = updatedAt
        self.errorMessage = errorMessage
        self.articlesScanned = articlesScanned
        self.candidatesJudged = candidatesJudged
        self.newPendingCandidates = newPendingCandidates
    }

    /// The three counters decode leniently because the app and the server
    /// deploy on independent cadences — a build of ForcesAdmin can reach a
    /// server that predates them. Missing counters read as 0 rather than
    /// failing the whole response; the state/timestamp fields above are
    /// required because a status without them is meaningless.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        state = try container.decode(State.self, forKey: .state)
        trigger = try container.decode(Trigger.self, forKey: .trigger)
        startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        finishedAt = try container.decodeIfPresent(Date.self, forKey: .finishedAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
        articlesScanned = try container.decodeIfPresent(Int.self, forKey: .articlesScanned) ?? 0
        candidatesJudged = try container.decodeIfPresent(Int.self, forKey: .candidatesJudged) ?? 0
        newPendingCandidates = try container.decodeIfPresent(Int.self, forKey: .newPendingCandidates) ?? 0
    }

    public static let idle = MilestonesJobStatusDTO(
        state: .idle, trigger: .manual, startedAt: nil, finishedAt: nil, updatedAt: Date(), errorMessage: nil
    )
}
