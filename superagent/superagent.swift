//
//  superagent.swift
//  superagent
//
//  Created by Simon Weniger on 06.07.23.
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

enum DocumentTypes: String {
	case text = "TEXT"
	case pdf = "PDF"
	case youtube = "YOUTUBE"
	case csv = "CSV"
	case url = "URL"
}

enum LLMTypes : String {
	case openai = "OPENAI"
	case react = "REACT"
}

enum ToolTypes: String {
	case search = "SEARCH"
	case wolframAlpha = "WOLFRAM_ALPHA"
	case replicate = "REPLICATE"
	case zapier = "ZAPIER_NLA"
	case agent = "AGENT"
	case openapi = "OPENAPI"
}

struct LLMModel {
	enum Provider: String {
		case openai
		case openaiChat = "openai-chat"
		case anthropic
		case cohere
	}
	
	let provider: Provider
	let model: String
	let apiKey: String?
	
}

struct SuperagentSDK {
	
	var baseUrl: String
	var authToken: String
	
	// init auth and api url
	init(authToken: String) {
		self.baseUrl = "https://api.superagent.sh/api/v1"
		self.authToken = authToken
	}
	
	//createRequest
	private func createRequest(method: HttpMethod, endpoint: String, data: [String: Any]? = nil) throws -> URLRequest {
		guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
			throw URLError(.badURL)
		}
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue.uppercased()
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("Bearer \(self.authToken)", forHTTPHeaderField: "authorization")
		
		if let data = data {
			if method == .get {
				var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
				components.queryItems = data.map {
					URLQueryItem(name: $0.key, value: "\($0.value)")
				}
				request.url = components.url
			} else {
				let jsonData = try JSONSerialization.data(withJSONObject: data)
				request.httpBody = jsonData
				
				if data.keys.contains("input") {
					request.setValue(self.authToken, forHTTPHeaderField: "X-SUPERAGENT-API-KEY")
				}
			}
		}
		return request
	}
	
	// defined Request
	private func request(method: HttpMethod, endpoint: String, data: [String: Any]? = nil) async throws -> Any  {
		let request = try createRequest(method: method, endpoint: endpoint, data: data)
		let (data, response) = try await URLSession.shared.data(for: request)
		
		if let httpResponse = response as? HTTPURLResponse,
		   200..<300 ~= httpResponse.statusCode {
			if let output = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
				return output
			}
		} else {
			if let output = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
			   let _ = output["message"] as? String {
				throw SuperagentError.requestFailed
			} else {
				throw SuperagentError.invalidResponse
			}
		}
		return response
	}
	
	
	//Prompts
	///Retuns a specific prompt
	func getPrompt(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/prompts/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Delete prompt
	func deletePrompt(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .delete, endpoint: "/prompts/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Lists all prompts
	func listPrompts(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/prompts")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Update a specific prompt
	func updatePrompt(id: String,
					  name: String,
					  inputVariables: [String] = [],
					  template: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "input_variables": inputVariables,
									  "template": template]
		do {
			let data = try await request(method: .patch, endpoint: "/prompts/\(id)", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	///Create a new prompt
	func createPrompt(name: String,
					  inputVariables: [String] = [],
					  template: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "input_variables": inputVariables,
									  "template": template]
		do {
			let data = try await request(method: .post, endpoint: "/prompts", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	//Documents
	///Retuns a specific document
	func getDocument(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/documents/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Delete prompt
	func deleteDocument(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .delete, endpoint: "/documents/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Lists all prompts
	func listDocuments(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/documents")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Create a new prompt
	func createDocument(name: String,
						 url: URL,
						 type: DocumentTypes,
						 authorization: Any? = nil,
					  template: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "url": url,
									  "type": type,
									  "authorization": authorization as Any]
		do {
			let data = try await request(method: .post, endpoint: "/documents", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	//Agents
	///Retuns a specific agent
	func getAgent(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/agents/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Delete prompt
	func deleteAgent(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .delete, endpoint: "/agents/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Lists all prompts
	func listAgents(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/agents")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Create a new prompt
	func createAgent(name: String,
					 llm: LLMModel,
					 type: LLMTypes = .react,
					 hasMemory: Bool,
					 promptId: String? = nil) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "llm": llm,
									  "type": type,
									  "hasMemory": hasMemory,
									  "promptId": promptId as Any]
		do {
			let data = try await request(method: .post, endpoint: "/agents", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	///Create a new prediction
	func createAgent(id: String,
					 input: String,
					 hasStreaming: Bool) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": input,
									  "has_Streaming": hasStreaming]
		do {
			let data = try await request(method: .post, endpoint: "/agents\(id)", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	//Agent Documents
	///Get all Documents from an Agent
	func getAgentDocuments() async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/agent-documents")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Add a Document to an Agent
	func createAgentDocument(documentId: String,
							 agentId: String) async throws -> [String: Any] {
		let payload: [String: Any] = ["documentId": documentId,
									  "agentId": agentId]
		do {
			let data = try await request(method: .post, endpoint: "/agents", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	///Delet  a Document from an Agent
	func deleteAgentDocument(agentDocumentId: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .delete, endpoint: "/agent-documents\(agentDocumentId)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
	
	
	//Tools
	///Retuns a specific tool
	func getTool(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/tools/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Delete tool
	func deleteTool(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .delete, endpoint: "/tools/\(id)")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Lists all tools
	func listTools(id: String) async throws -> [String: Any] {
		do {
			let data = try await request(method: .get, endpoint: "/tools")
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToRetrievePrompt
		}
	}
	
	///Create a new tool
	func createTool(name: String,
					type: ToolTypes,
					metadata: Any? = nil) async throws -> [String: Any] {
		let payload: [String: Any] = ["name": name,
									  "type": type,
									  "metadata": metadata as Any]
		do {
			let data = try await request(method: .post, endpoint: "/tools", data: payload)
			return data as? [String: Any] ?? [:]
		} catch {
			throw SuperagentError.failedToCreatePrompt
		}
	}
}