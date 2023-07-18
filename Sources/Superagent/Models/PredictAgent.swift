//
// PredictAgent.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation



public struct PredictAgent {

	public var input: [[String:String]]
    public var hasStreaming: Bool?

    public init(input: [[String:String]], hasStreaming: Bool? = nil) {
        self.input = input
        self.hasStreaming = hasStreaming
    }

    public enum CodingKeys: String, CodingKey { 
        case input
        case hasStreaming = "has_streaming"
    }

}
