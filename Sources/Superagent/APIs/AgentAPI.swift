//
// AgentAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Almonfire


open class AgentAPI {
    /**
     Create Agent

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAgent(body: Agent, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		createAgentRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Agent
     - POST /api/v1/agents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createAgentRequest(body: Agent) -> RequestBuilder<Void> {
        let path = "/api/v1/agents"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Agent

     - parameter agentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteAgent(agentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteAgentRequest(agentId: agentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Agent
     - DELETE /api/v1/agents/{agentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteAgentRequest(agentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agents/{agentId}"
        let agentIdPreEscape = "\(agentId)"
        let agentIdPostEscape = agentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentId}", with: agentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Agent

     - parameter agentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAgent(agentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getAgentRequest(agentId: agentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Agent
     - GET /api/v1/agents/{agentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getAgentRequest(agentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agents/{agentId}"
        let agentIdPreEscape = "\(agentId)"
        let agentIdPostEscape = agentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentId}", with: agentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List All Agents

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listAgents(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listAllAgentsApiV1AgentsGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List All Agents
     - GET /api/v1/agents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listAgentsRequest() -> RequestBuilder<Void> {
        let path = "/api/v1/agents"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Patch Agent

     - parameter body: (body)  
     - parameter agentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateAgent(body: Any, agentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        updateAgentRequest(body: body, agentId: agentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Patch Agent
     - PATCH /api/v1/agents/{agentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  
     - parameter agentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func updateAgentRequest(body: Any, agentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agents/{agentId}"
        let agentIdPreEscape = "\(agentId)"
        let agentIdPostEscape = agentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentId}", with: agentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Prompt Agent

     - parameter body: (body)  
     - parameter agentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func prompt(body: PredictAgent, agentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        promptAgentApiV1AgentsAgentIdPredictPostWithRequestBuilder(body: body, agentId: agentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Prompt Agent
     - POST /api/v1/agents/{agentId}/predict

     - API Key:
       - type: apiKey X_SUPERAGENT_API_KEY 
       - name: APIKeyHeader
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  
     - parameter agentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func promptRequest(body: PredictAgent, agentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agents/{agentId}/predict"
        let agentIdPreEscape = "\(agentId)"
        let agentIdPostEscape = agentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentId}", with: agentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
