//
//  superagentTests.swift
//  superagentTests
//
//  Created by Simon Weniger on 06.07.23.
//

import XCTest
@testable import superagent

class SuperagentSdkTests: XCTestCase {

	var superagentSDK: SuperagentSDK?

	override func setUpWithError() throws {
		superagentSDK = SuperagentSDK(authToken: "your_auth_token")
	}

	override func tearDownWithError() throws {
		superagentSDK = nil
	}

	func testGetPrompt() throws {
		let expectation = self.expectation(description: "GET Prompt")
		
		Task{
			do{
				let id = "sample_id" // Replace with a valid prompt ID
				let result = try await (self.superagentSDK?.getPrompt(id: id))
				XCTAssertNotNil(result, "GET Prompt failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to GET Prompt with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testListPrompts() throws {
		let expectation = self.expectation(description: "List Prompts")
		
		Task{
			do{
				let result = try await (self.superagentSDK?.listPrompts(id: ""))
				XCTAssertNotNil(result, "List Prompts failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to List Prompts with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testCreatePrompt() throws {
		let expectation = self.expectation(description: "Create Prompt")
		
		Task {
			do {
				let name = "sample_name"
				let template = "sample_template"
				let result = try await (self.superagentSDK?.createPrompt(name: name, inputVariables: [], template: template))
				XCTAssertNotNil(result, "Create prompt failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to create promo with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testDeletePrompt() throws {
		let expectation = self.expectation(description: "Delete Prompt")
		
		Task {
			do {
				let id = "sample_id" // Replace with a valid prompt ID
				let result = try await (self.superagentSDK?.deletePrompt(id: id))
				XCTAssertNotNil(result, "Delete prompt failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Delete prompt with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}
	
	func testGetDocument() throws {
		let expectation = self.expectation(description: "GET Document")
		
		Task{
			do{
				let id = "sample_id" // Replace with a valid document ID
				let result = try await (self.superagentSDK?.getDocument(id: id))
				XCTAssertNotNil(result, "GET Document failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to GET Document with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testListDocuments() throws {
		let expectation = self.expectation(description: "List Documents")
		
		Task{
			do{
				let result = try await (self.superagentSDK?.listDocuments(id: ""))
				XCTAssertNotNil(result, "List Documents failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to List Documents with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testCreateDocument() throws {
		let expectation = self.expectation(description: "Create Document")
		
		Task {
			do {
				let name = "sample_name"
				let url = URL(string: "https://www.example.com")!
				let type = DocumentTypes.pdf
				let result = try await (self.superagentSDK?.createDocument(name: name, url: url, type: type,authorization:nil,template: ""))
				XCTAssertNotNil(result, "Create document failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Create document with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testDeleteDocument() throws {
		let expectation = self.expectation(description: "Delete Document")
		
		Task {
			do {
				let id = "sample_id" // Replace with a valid document ID
				let result = try await (self.superagentSDK?.deleteDocument(id: id))
				XCTAssertNotNil(result, "Delete document failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Delete document with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}
	
	func testGetAgent() throws {
		let expectation = self.expectation(description: "GET Agent")
		
		Task{
			do{
				let id = "sample_id" // Replace with a valid agent ID
				let result = try await (self.superagentSDK?.getAgent(id: id))
				XCTAssertNotNil(result, "GET Agent failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to GET Agent with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testListAgents() throws {
		let expectation = self.expectation(description: "List Agents")
		
		Task{
			do{
				let result = try await (self.superagentSDK?.listAgents(id: ""))
				XCTAssertNotNil(result, "List Agents failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to List Agents with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testCreateAgent() throws {
		let expectation = self.expectation(description: "Create Agent")
		
		Task {
			do {
				let name = "sample_name"
				let llm = LLMModel(provider: .openai, model: "sample_model", apiKey: "sample_key")
				let hasMemory = false
				
				let result = try await (self.superagentSDK?.createAgent(name: name, llm: llm, type: .openai, hasMemory: hasMemory, promptId: nil))
				XCTAssertNotNil(result, "Create agent failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Create agent with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testDeleteAgent() throws {
		let expectation = self.expectation(description: "Delete Agent")
		
		Task {
			do {
				let id = "sample_id" // Replace with a valid agent ID
				let result = try await (self.superagentSDK?.deleteAgent(id: id))
				XCTAssertNotNil(result, "Delete agent failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Delete agent with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testGetTool() throws {
		let expectation = self.expectation(description: "GET Tool")
		
		Task{
			do{
				let id = "sample_id" // Replace with a valid tool ID
				let result = try await (self.superagentSDK?.getTool(id: id))
				XCTAssertNotNil(result, "GET Tool failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to GET Tool with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testListTools() throws {
		let expectation = self.expectation(description: "List Tools")
		
		Task{
			do{
				let result = try await (self.superagentSDK?.listTools(id: ""))
				XCTAssertNotNil(result, "List Tools failed")
				expectation.fulfill()
			} catch{
				XCTFail("Failed to List Tools with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testCreateTool() throws {
		let expectation = self.expectation(description: "Create Tool")
		
		Task {
			do {
				let name = "sample_name"
				let type = ToolTypes.search
				
				let result = try await (self.superagentSDK?.createTool(name: name, type: type, metadata: nil))
				
				XCTAssertNotNil(result, "Create tool failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Create tool with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

	func testDeleteTool() throws {
		let expectation = self.expectation(description: "Delete Tool")
		
		Task {
			do {
				let id = "sample_id" // Replace with a valid tool ID
				let result = try await (self.superagentSDK?.deleteTool(id: id))
				XCTAssertNotNil(result, "Delete tool failed")
				expectation.fulfill()
			} catch {
				XCTFail("Failed to Delete tool with error \(error)")
			}
		}
		
		waitForExpectations(timeout: 5, handler: nil)
	}

}
