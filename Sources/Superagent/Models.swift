//
//  File.swift
//  
//
//  Created by vonweniger on 07.07.23.
//

import Foundation

public struct Agent {
	public let id: String
	public let userId: String
	public let name: String
	public let type: String
	public let hasMemory: Bool
	public let isPublic: Bool
	public let createdAt: String
	public let updatedAt: String
	
	
	public init?(data: [String: Any]) {
		guard let id = data["id"] as? String,
			  let userId = data["userId"] as? String,
			  let name = data["name"] as? String,
			  let type = data["type"] as? String,
			  let hasMemory = data["hasMemory"] as? Bool,
			  let isPublic = data["isPublic"] as? Bool,
			  let createdAt = data["createdAt"] as? String,
			  let updatedAt = data["updatedAr"] as? String
		else {
			return nil
		}
		
		self.id = id
		self.name = name
		self.userId = userId
		self.type = type
		self.hasMemory = hasMemory
		self.isPublic = isPublic
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}
