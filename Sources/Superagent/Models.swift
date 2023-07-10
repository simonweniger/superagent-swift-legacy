//
//  File.swift
//  
//
//  Created by vonweniger on 07.07.23.
//

import Foundation



public struct Prompt {
	public let id: String
	public let name: String
	public let template: String
	public let inputVariables: [String]
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let name = data["name"] as? String,
			  let template = data["template"] as? String,
			  let inputVariables = data["input_variables"] as? [String]
		else {
			return nil
		}
		
		self.id = id
		self.name = name
		self.template = template
		self.inputVariables = inputVariables
	}
}

public struct Tool {
	public let id: String
	public let name: String
	public let type: String
	public let userId: String
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let name = data["name"] as? String,
			  let type = data["type"] as? String,
			  let userId = data["userId"] as? String
		else {
			return nil
		}
		
		self.id = id
		self.name = name
		self.type = type
		self.userId = userId
	}
}

public struct Document {
	public let id: String
	public let userId: String
	public let user: Any
	public let type: String
	public let url: String
	public let createdAt: String
	public let updatedAt: String
	public let index: Any
	public let agent: Any
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let userId = data["userId"] as? String,
			  let user = data["user"],
			  let type = data["type"] as? String,
			  let url = data["url"] as? String,
			  let createdAt = data["createdAt"] as? String,
			  let updatedAt = data["updatedAt"] as? String,
			  let index = data["index"],
			  let agent = data["Agent"]
		else {
			return nil
		}
		
		self.id = id
		self.userId = userId
		self.user = user
		self.type = type
		self.url = url
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.index = index
		self.agent = agent
	}
}

struct Response: Codable {
	let data: AgentData
	let success: Int
}

public struct AgentData: Codable {
	public let agentDocument, agentMemory, agentTool, agentTrace: String?
	public let createdAt, document, documentId: String?
	public let hasMemory: Int
	public let id: String
	public let isPublic: Int
	public let llm: LLM
	public let name, prompt: String?
	public let promptId, tool, toolId: String?
	public let type: String
	public let updatedAt: String
	public let user: User
	public let userId: String
}

public struct LLM: Codable {
	public let apiKey: String
	public let model: String
	public let provider: String

	enum CodingKeys: String, CodingKey {
		case model = "model"
		case apiKey = "api_key"
		case provider = "provider"
	}
}

public struct User: Codable {
	public let agent, agentTrace, apiToken, document: String?
	public let prompt, tool: String?
	public let createdAt: String
	public let deletedAt: String?
	public let email, id, name, password: String
	public let profile, updatedAt: String?
}


public struct AgentTool {
	public let id: String
	public let agent: Any
	public let agentId: String
	public let tool: Any
	public let toolId: String
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let agent = data["agent"],
			  let agentId = data["agentId"] as? String,
			  let tool = data["tool"],
			  let toolId = data["toolId"] as? String
		else {
			return nil
		}
		
		self.id = id
		self.agent = agent
		self.agentId = agentId
		self.tool = tool
		self.toolId = toolId
	}
}

public struct AgentDocument {
	public let id: String
	public let agent: Any
	public let agentId: String
	public let document: Any
	public let documentId: String
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let agent = data["agent"],
			  let agentId = data["agentId"] as? String,
			  let document = data["document"],
			  let documentId = data["documentId"] as? String
		else {
			return nil
		}
		
		self.id = id
		self.agent = agent
		self.agentId = agentId
		self.document = document
		self.documentId = documentId
	}
}
