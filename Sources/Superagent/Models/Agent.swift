//
// Agent.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation



public struct Agent: Codable {

    public var name: String
    public var type: String
    public var llm: LLM?
    public var hasMemory: Bool?
    public var promptId: String?

    public init(name: String, type: String, llm: LLM? = nil, hasMemory: Bool? = nil, promptId: String? = nil) {
        self.name = name
        self.type = type
        self.llm = llm
        self.hasMemory = hasMemory
        self.promptId = promptId
    }

	public enum LLM : String {
		case provider,
		case mode,
		case apiKey
	}

}
