//
//  Streaming.swift
//  
//
//  Created by Simon Weniger on 17.08.23.
//

import Foundation

struct StreamCompletionResponse: Decodable {
	let choices: [StreamChoice]
}

struct StreamChoice: Decodable {
	let finishReason: String?
	let delta: StreamMessage
}

struct StreamMessage: Decodable {
	let content: String?
	let role: String?
}
