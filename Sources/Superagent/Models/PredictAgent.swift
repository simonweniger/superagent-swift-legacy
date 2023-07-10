//
// PredictAgent.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation



public struct PredictAgent: Codable {

    public var input: Any
    public var hasStreaming: Bool?

    public init(input: Any, hasStreaming: Bool? = nil) {
        self.input = input
        self.hasStreaming = hasStreaming
    }

    public enum CodingKeys: String, CodingKey { 
        case input
        case hasStreaming = "has_streaming"
    }

}
