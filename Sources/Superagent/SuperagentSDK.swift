//
//  SuperagentSDK.swift
//  
//
//  Created by Simon Weniger on 10.07.23.
//

import Foundation

enum HttpMethod: String {
	case get = "GET"
	case post = "POST"
	case delete = "DELETE"
	case patch = "PATCH"
}

enum SuperagentError: Error {
	case invalidResponse
	case requestFailed
	case failedToRetrievePrompt
	case failedToUpdatePrompt
	case failedToCreatePrompt
}

@available(macOS 12.0, *)
public struct SuperagentSDK {
	
	public var baseUrl: String
	public var apiKey: String
	
	// init auth and api url
	public init(apiKey: String) {
		self.baseUrl = "https://api.superagent.sh/api/v1"
		self.apiKey = apiKey
	}
	
	//createRequest
	private func createRequest(method: HttpMethod, endpoint: String, data: [String: Any]? = nil) throws -> URLRequest {
		guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
			throw URLError(.badURL)
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue.uppercased()
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("Bearer \(self.apiKey)", forHTTPHeaderField: "Authorization")
		
		if let data = data {
			if method == .get {
				var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
				components.queryItems = data.map {
					URLQueryItem(name: $0.key, value: "\($0.value)")
				}
				guard let componentUrl = components.url else { throw SuperagentError.invalidResponse }
				request.url = componentUrl
			} else {
				let jsonData = try JSONSerialization.data(withJSONObject: data)
				request.httpBody = jsonData
				
				if data.keys.contains("input") {
					request.setValue(self.apiKey, forHTTPHeaderField: "X-SUPERAGENT-API-KEY")
				}
			}
		}
		return request
	}
	
	// defined Request
	private func request(method: HttpMethod, endpoint: String, data: [String: Any]? = nil) async throws -> Any  {
		let request = try createRequest(method: method, endpoint: endpoint, data: data)
		let (data, response) = try await URLSession.shared.data(for: request)
	  
		if let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode {
		  if let output = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
			  return output
		  } else {
			  throw SuperagentError.invalidResponse
		  }
		}
		return response
	}
	
	//Prompts
	///Retuns a specific prompt
	public func getPrompt(id: String) async throws -> Prompt {
		let data = try await request(method: .get, endpoint: "/prompts/\(id)")
		guard let responseData = data as? [String: Any],
			  let jsonData = responseData["data"] as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		
		let decoder = JSONDecoder()
		let jsonDataEncoded = try JSONSerialization.data(withJSONObject: jsonData, options: [])
		let prompt = try decoder.decode(Prompt.self, from: jsonDataEncoded)
		
		return prompt
	}
	
	///Delete prompt
	public func deletePrompt(id: String) async throws -> [String: Any] {
		let data = try await request(method: .delete, endpoint: "/prompts/\(id)")
		guard let responseData = data as? [String: Any],
			  let success = responseData["success"] as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		
		return success
	}
	
	///Lists all prompts
	public func listPrompts(id: String) async throws -> [Prompt] {
		let data = try await request(method: .get, endpoint: "/prompts")
		
		guard let responseData = data as? [String: Any],
			  let jsonArray = responseData["data"] as? [[String: Any]] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		
		let decoder = JSONDecoder()
		var prompts = [Prompt]()
		
		for json in jsonArray {
			let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
			let prompt = try decoder.decode(Prompt.self, from: jsonData)
			prompts.append(prompt)
		}
		
		return prompts
	}
	
	///Update a specific prompt
	public func updatePrompt(id: String, name: String, inputVariables: [String] = [], template: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name, "input_variables": inputVariables, "template": template]
		let data = try await request(method: .patch, endpoint: "/prompts/\(id)", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}
	
	///Create a new prompt
	public func createPrompt(name: String, inputVariables: [String] = [], template: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name, "input_variables": inputVariables, "template": template]
		let data = try await request(method: .post, endpoint: "/prompts", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}
	
	//Documents
	///Returns a specific document
	public func getDocument(id: String) async throws -> [String: Any] {
		let data = try await request(method: .get, endpoint: "/documents/\(id)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Delete document
	public func deleteDocument(id: String) async throws -> [String: Any] {
		let data = try await request(method: .delete, endpoint: "/documents/\(id)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Lists all documents
	public func listDocuments(id: String) async throws -> [String: Any] {
		let data = try await request(method: .get, endpoint: "/documents")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Create a new document
	public func createDocument(name: String,
						 url: URL,
						 type: String,
						 authorization: Any? = nil) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "url": url.absoluteString, // passing String instead of URL
									  "type": type, // passing rawValue of enum
									  "authorization": authorization as Any]
		let data = try await request(method: .post, endpoint: "/documents", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}
	
	//Agents
	///Returns a specific agent
	public func getAgent(id: String) async throws -> Agent {
		let data = try await request(method: .get, endpoint: "/agents/\(id)")
		guard let responseData = data as? [String: Any],
			  let jsonData = responseData["data"] as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		
		let decoder = JSONDecoder()
		let jsonDataEncoded = try JSONSerialization.data(withJSONObject: jsonData, options: [])
		let agent = try decoder.decode(Agent.self, from: jsonDataEncoded)
		
		return agent
	}

	///Delete agent
	public func deleteAgent(id: String) async throws -> [String: Any] {
		let data = try await request(method: .delete, endpoint: "/agents/\(id)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Lists all agents
	public func listAgents(id: String) async throws -> [String: Any] {
		let data = try await request(method: .get, endpoint: "/agents")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Create a new agent
	public func createAgent(name: String,
					 llm: Agent.LLM,
					 type: String,
					 hasMemory: Bool,
					 promptId: String? = nil) async throws -> Agent {
		let payload: [String: Any] = ["name": name,
									  "llm": ["provider": llm.provider, "model": llm.model, "api_key": llm.apiKey],
									  "type": type,
									  "hasMemory": hasMemory,
									  "promptId": promptId ?? ""]
		let data = try await request(method: .post, endpoint: "/agents", data: payload)
		
		//print("response: \(data)")
		
		guard let responseData = data as? [String: Any],
			  let jsonData = responseData["data"] as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		
		print("response data:\(jsonData)")
		
		let decoder = JSONDecoder()
		let jsonDataEncoded = try JSONSerialization.data(withJSONObject: jsonData, options: [])
		
		print("JsonDataEncoded \(jsonDataEncoded)")
		let agent = try decoder.decode(Agent.self, from: jsonDataEncoded)
		
		print("returned Agent \(agent)")
		
		return agent
	}

	///Create a new prediction
	public func createPrediction(id: String,
						  input: String,
						  hasStreaming: Bool) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": input,
									  "has_Streaming": hasStreaming]
		let data = try await request(method: .post, endpoint: "/agents\(id)", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}
	
	//Agent Documents
	///Get all Documents from an Agent
	public func getAgentDocuments() async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/agent-documents")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}

	///Add a Document to an Agent
	public func createAgentDocument(documentId: String, agentId: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["documentId": documentId, "agentId": agentId]
		let data = try await request(method: .post, endpoint: "/agents", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}

	///Delete a Document from an Agent
	public func deleteAgentDocument(agentDocumentId: String) async throws -> [String: Any] {
		let data = try await request(method: .delete, endpoint: "/agent-documents/\(agentDocumentId)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}

	//Tools
	///Returns a specific tool
	public func getTool(id: String) async throws -> [String: Any] {
		let data = try await request(method: .get, endpoint: "/tools/\(id)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Delete tool
	public func deleteTool(id: String) async throws -> [String: Any] {
		let data = try await request(method: .delete, endpoint: "/tools/\(id)")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Lists all tools
	public func listTools(id: String) async throws -> [String: Any] {
		let data = try await request(method: .get, endpoint: "/tools")
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToRetrievePrompt
		}
		return outputData
	}

	///Create a new tool
	public func createTool(name: String, type: String, metadata: Any? = nil) async throws -> [String: Any] {
		var payload: [String: Any] = ["name": name, "type": type]
		if let metadata = metadata {
			payload["metadata"] = metadata
		}
		let data = try await request(method: .post, endpoint: "/tools", data: payload)
		guard let outputData = data as? [String: Any] else {
			throw SuperagentError.failedToCreatePrompt
		}
		return outputData
	}
}
