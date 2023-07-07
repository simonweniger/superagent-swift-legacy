//
//  Models.swift
//  
//
//  Created by Simon Weniger on 07.07.23.
//

import Foundation

public struct Message: Codable {
	public let role: String
	public let agentId: String
	public let content: String
	
	public init(role: String, content: String, agentId: String) {
		self.role = role
		self.input = input
		self.agentId = agentId ?? ""
	}
}

public struct LLMModel: Codable {
	public enum Provider: String {
		case openai
		case openaiChat = "openai-chat"
		case anthropic
		case cohere
	}
	
	public let provider: Provider
	public let model: String
	public let apiKey: String?
	
}

public struct Agent: Codable {
	public enum AgentTypes: String {
		case openai = "OPENAI"
		case react = "REACT"
	}
	
	public let id: String
	public let userId: String?
	public let user: Any?
	public let name: String
	public let type: AgentTypes
	public let llm: LLMModel
	public let hasMemory: Bool
	public let AgentMemory: Any?
	public let promptId: String?
}

public struct AgentDocument: Codable {
	public let id: String
	public let agent: Any
	public let agentId: String
	public let document: Any
	public let documentId: String
}

public struct AgentTool: Codable {
	public let id: String
	public let agent: Any
	public let agentId: String
	public let tool: String
	public let toolId: String
}

public struct Tool: Codable {
	public enum ToolTypes: String {
		case search = "SEARCH"
		case wolframAlpha = "WOLFRAM_ALPHA"
		case replicate = "REPLICATE"
		case zapier = "ZAPIER_NLA"
		case agent = "AGENT"
		case openapi = "OPENAPI"
	}

	
	public let id: String
	public let name: String
	public let type: ToolTypes
}

public struct Prompt: Codable {
	public let id: String
	public let name: String
	public let template: String
	public let inputVariables: [String]
}

public struct Document: Codable {
	public enum DocumentTypes: String {
		case text = "TEXT"
		case pdf = "PDF"
		case youtube = "YOUTUBE"
		case csv = "CSV"
		case url = "URL"
	}
	
	public let name: String?
	public let id: String?
	public let userId: String?
	public let user: Any?
	public let type: DocumentTypes
	public let authorization: Any?
	public let url: String
	public let createdAt: String
	public let updatedAt: String
	public let index: Any?
	public let agent: Any?
}
