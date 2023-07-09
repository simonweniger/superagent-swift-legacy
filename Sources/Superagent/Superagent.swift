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



@available(macOS 12.0, *)
public struct SuperagentAPI: @unchecked Sendable {
	
	private let urlString = "https://api.superagent.sh/api/v1"
	private let apiKey: String
	
	
	public init(apiKey: String) {
		self.apiKey = apiKey
	}
	
	//createRequest
	private func createRequest(method: HttpMethod, endpoint: String, data: [String: Any]? = nil) throws -> URLRequest {
		guard let url = URL(string: "\(self.urlString)\(endpoint)") else {
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
	public func getPrompt(id: String, completion: @escaping (Result<Prompt, Error>) -> Void) {

		Task {
			do {
				let data = try await request(method: .get, endpoint: "/prompts/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				guard let prompt = Prompt(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(prompt))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	///Delete prompt
	public func deletePrompt(id: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/prompts/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	///Lists all prompts
	public func listPrompts(completion: @escaping (Result<[Prompt], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/prompts")
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				let prompts = outputData.compactMap { promptData in
					return Prompt(data: promptData)
				}
				
				completion(.success(prompts))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	///Update a specific prompt
	public func updatePrompt(id: String,
							 name: String,
							 inputVariables: [String] = [],
							 template: String,
							 completion: @escaping (Result<Prompt, Error>) -> Void) {
		let payload: [String: Any] = [
			"name": name,
			"input_variables": inputVariables,
			"template": template
		]

		Task {
			do {
				let data = try await request(method: .patch, endpoint: "/prompts/\(id)", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let prompt = Prompt(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(prompt))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	///Create a new prompt
	public func createPrompt(name: String,
							 inputVariables: [String] = [],
							 template: String,
							 completion: @escaping (Result<Prompt, Error>) -> Void) {
		let payload: [String: Any] = [
			"name": name,
			"input_variables": inputVariables,
			"template": template
		]
		
		Task {
			do {
				let data = try await request(method: .post, endpoint: "/prompts", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let prompt = Prompt(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(prompt))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	//Documents
	///Returns a specific document
	public func getDocument(id: String, completion: @escaping (Result<Document, Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/documents/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				guard let document = Document(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(document))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Delete document
	public func deleteDocument(id: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/documents/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Lists all documents
	public func listDocuments(completion: @escaping (Result<[Document], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/documents")
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				let documents = try outputData.compactMap { documentData -> Document? in
					guard let document = Document(data: documentData) else {
						throw SuperagentError.requestFailed
					}
					return document
				}
				
				completion(.success(documents))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Create a new document
	public func createDocument(name: String,
							   url: URL,
							   type: String,
							   authorization: Any? = nil,
							   completion: @escaping (Result<Document, Error>) -> Void) {

		let payload: [String: Any] = [
			"name": name,
			"url": url.absoluteString,
			"type": type,
			"authorization": authorization as Any
		]

		Task {
			do {
				let data = try await request(method: .post, endpoint: "/documents", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let document = Document(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(document))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	//Agents
	///Returns a specific agent
	public func getAgent(id: String, completion: @escaping (Result<Agent, Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/agents/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				guard let agent = Agent(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(agent))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Delete agent
	public func deleteAgent(id: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/agents/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Lists all agents
	public func listAgents(completion: @escaping (Result<[Agent], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/agents")
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				let agents = outputData.compactMap { Agent(data: $0) }
				completion(.success(agents))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Create a new agent
	public func createAgent(name: String,
							provider: String,
							model: String,
							apiKey: String?,
							type: String,
							hasMemory: Bool,
							promptId: String? = nil,
							completion: @escaping (Result<Agent, Error>) -> Void) {

		let payload: [String: Any] = [
			"name": name,
			"llm": [
				"provider": provider,
				"model": model,
				"api_key": apiKey ?? ""
			],
			"type": type,
			"hasMemory": hasMemory,
			"promptId": promptId ?? ""
		]

		Task {
			do {
				let data = try await request(method: .post, endpoint: "/agents", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let agent = Agent(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				print("Create agent result \(agent)")
				completion(.success(agent))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Create a new prediction
	public func createPrediction(agentId: String,
								 input: String,
								 hasStreaming: Bool,
								 completion: @escaping (Result<String, Error>) -> Void) {

		let payload: [String: Any] = [
			"name": input,
			"has_Streaming": hasStreaming
		]

		Task {
			do {
				let data = try await request(method: .post, endpoint: "/agents\(agentId)", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				let response = outputData["data"] as! String
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	//Agent Documents
	///Get all Documents from an Agent
	public func getAgentDocuments(completion: @escaping (Result<[AgentDocument], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/agent-documents")
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				var agentDocuments: [AgentDocument] = []
				for agentDocumentData in outputData {
					if let agentDocument = AgentDocument(data: agentDocumentData) {
						agentDocuments.append(agentDocument)
					}
				}
				
				completion(.success(agentDocuments))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Add a Document to an Agent
	public func addAgentDocument(documentId: String, agentId: String, completion: @escaping (Result<AgentDocument, Error>) -> Void) {
		let payload: [String: Any] = ["documentId": documentId, "agentId": agentId]
		
		Task {
			do {
				let data = try await request(method: .post, endpoint: "/agent-documents", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let agentDocument = AgentDocument(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(agentDocument))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Delete a Document from an Agent
	public func deleteAgentDocument(agentDocumentId: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/agent-documents/\(agentDocumentId)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}
	
	//Agent Tools
	///Get all Tools from an Agent
	public func getAgentTools(completion: @escaping (Result<[AgentTool], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/agent-tools")
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				var agentTools: [AgentTool] = []
				for agentToolData in outputData {
					if let agentTool = AgentTool(data: agentToolData) {
						agentTools.append(agentTool)
					}
				}
				
				completion(.success(agentTools))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Add a Tool to an Agent
	public func addAgentTool(toolId: String, agentId: String, completion: @escaping (Result<AgentTool, Error>) -> Void) {
		let payload: [String: Any] = ["agentId": agentId, "toolId": toolId]
		
		Task {
			do {
				let data = try await request(method: .post, endpoint: "/agents-tools", data: payload)
				guard let outputData = data as? AgentTool else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Delete a Tool from an Agent
	public func deleteAgentTool(agentToolId: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {

		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/agent-tools/\(agentToolId)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}

	//Tools
	///Returns a specific tool
	public func getTool(id: String, completion: @escaping (Result<Tool, Error>) -> Void) {

		Task {
			do {
				let data = try await request(method: .get, endpoint: "/tools/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				guard let tool = Tool(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(tool))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Delete tool
	public func deleteTool(id: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {

		Task {
			do {
				let data = try await request(method: .delete, endpoint: "/tools/\(id)")
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				completion(.success(outputData))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Lists all tools
	public func listTools(completion: @escaping (Result<[Tool], Error>) -> Void) {
		Task {
			do {
				let data = try await request(method: .get, endpoint: "/tools")
			 
				guard let outputData = data as? [[String: Any]] else {
					throw SuperagentError.failedToRetrievePrompt
				}
				
				let tools = outputData.compactMap { Tool(data: $0) }
				
				completion(.success(tools))
			} catch {
				completion(.failure(error))
			}
		}
	}

	///Create a new tool
	public func createTool(name: String,
						   type: String,
						   metadata: Any,
						   completion: @escaping (Result<Tool, Error>) -> Void) {
		let payload: [String: Any] = ["name": name, "type": type, "metadata": metadata]
		
		Task {
			do {
				let data = try await request(method: .post, endpoint: "/tools", data: payload)
				guard let outputData = data as? [String: Any] else {
					throw SuperagentError.failedToCreatePrompt
				}
				
				guard let tool = Tool(data: outputData) else {
					throw SuperagentError.requestFailed
				}
				
				completion(.success(tool))
			} catch {
				completion(.failure(error))
			}
		}
	}
}
