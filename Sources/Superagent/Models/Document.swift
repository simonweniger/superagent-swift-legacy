//
// Document.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation



public struct Document {

    public var type: String
    public var url: String?
    public var name: String
    public var authorization: Any?
    public var metadata: Any?
    public var fromPage: Int?
    public var toPage: Int?
    public var splitter: Any?

    public init(type: String, url: String? = nil, name: String, authorization: Any? = nil, metadata: Any? = nil, fromPage: Int? = nil, toPage: Int? = nil, splitter: Any? = nil) {
        self.type = type
        self.url = url
        self.name = name
        self.authorization = authorization
        self.metadata = metadata
        self.fromPage = fromPage
        self.toPage = toPage
        self.splitter = splitter
    }

    public enum CodingKeys: String, CodingKey { 
        case type
        case url
        case name
        case authorization
        case metadata
        case fromPage = "from_page"
        case toPage = "to_page"
        case splitter
    }

}
