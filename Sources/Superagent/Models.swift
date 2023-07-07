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
	
	public init(role: String, content: String, agentId: String?) {
		self.role = role
		self.content = content
		self.agentId = agentId ?? ""
	}
}
