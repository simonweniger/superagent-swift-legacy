//
//  SuperagentSDK.swift
//  
//
//  Created by Simon Weniger on 10.07.23.
//

import Foundation


@available(macOS 12.0, *)
public struct SuperagentSDK: @unchecked Sendable {
	
	private let urlString = "https://api.superagent.sh/api/v1"
	private let apiKey: String
	
	
	public init(apiKey: String) {
		self.apiKey = apiKey
	}
	
	/**
	 Create Agent

	 - parameter body: (body)
	 - parameter completion: completion handler to receive the data and the error objects
	 */
	public class func createAgent(agent: Agent, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		
		//let agent = Agent(
		//	name: name,
		//	type: type,
		//	llm: LLM(apiKey: T##String, model: T##String, provider: T##String),
		//	hasMemory: hasMemory,
		//	promptId: promptId)
		
		
		createAgentRequest(body: agent).execute { (response, error) -> Void in
			if error == nil {
				completion((), error)
			} else {
				completion(nil, error)
			}
		}
	}
	
}
