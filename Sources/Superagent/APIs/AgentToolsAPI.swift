//
// AgentToolsAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class AgentToolsAPI {
    /**
     Create Agent Tool

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAgentTool(body: AgentTool, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createAgentToolRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Agent Tool
     - POST /api/v1/agent-tools

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createAgentToolRequest(body: AgentTool) -> RequestBuilder<Void> {
        let path = "/api/v1/agent-tools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Agent Tool

     - parameter agentToolId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteAgentTool(agentToolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteAgentToolRequest(agentToolId: agentToolId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Agent Tool
     - DELETE /api/v1/agent-tools/{agentToolId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentToolId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteAgentToolRequest(agentToolId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agent-tools/{agentToolId}"
        let agentToolIdPreEscape = "\(agentToolId)"
        let agentToolIdPostEscape = agentToolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentToolId}", with: agentToolIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Agent Tool

     - parameter agentToolId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAgentTool(agentToolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getAgentToolRequest(agentToolId: agentToolId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Agent Tool
     - GET /api/v1/agent-tools/{agentToolId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentToolId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getAgentToolRequest(agentToolId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agent-tools/{agentToolId}"
        let agentToolIdPreEscape = "\(agentToolId)"
        let agentToolIdPostEscape = agentToolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentToolId}", with: agentToolIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Agent Tools

     - parameter expand: (query)  (optional, default to false)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listAgentTools(expand: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listAgentToolsRequest(expand: expand).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Agent Tools
     - GET /api/v1/agent-tools

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter expand: (query)  (optional, default to false)

     - returns: RequestBuilder<Void> 
     */
    open class func listAgentToolsRequest(expand: Bool? = nil) -> RequestBuilder<Void> {
        let path = "/api/v1/agent-tools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "expand": expand
        ])


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
