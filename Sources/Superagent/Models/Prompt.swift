//
// Prompt.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation



public struct Prompt: Codable {

    public var name: String
    public var inputVariables: [Any]
    public var template: String

    public init(name: String, inputVariables: [Any], template: String) {
        self.name = name
        self.inputVariables = inputVariables
        self.template = template
    }

    public enum CodingKeys: String, CodingKey { 
        case name
        case inputVariables = "input_variables"
        case template
    }

}
