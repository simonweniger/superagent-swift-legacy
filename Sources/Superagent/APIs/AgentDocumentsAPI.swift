//
// AgentDocumentsAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class AgentDocumentsAPI {
    /**
     Create Agent Document

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAgentDocument(body: AgentDocument, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		createAgentDocumentRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Agent Document
     - POST /api/v1/agent-documents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createAgentDocumentRequest(body: AgentDocument) -> RequestBuilder<Void> {
        let path = "/api/v1/agent-documents"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Agent Document

     - parameter agentDocumentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteAgentDocument(agentDocumentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteAgentDocumentRequest(agentDocumentId: agentDocumentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Agent Document
     - DELETE /api/v1/agent-documents/{agentDocumentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentDocumentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteAgentDocumentRequest(agentDocumentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agent-documents/{agentDocumentId}"
        let agentDocumentIdPreEscape = "\(agentDocumentId)"
        let agentDocumentIdPostEscape = agentDocumentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentDocumentId}", with: agentDocumentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Agent Document

     - parameter agentDocumentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAgentDocument(agentDocumentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getAgentDocumentRequest(agentDocumentId: agentDocumentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Agent Document
     - GET /api/v1/agent-documents/{agentDocumentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter agentDocumentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getAgentDocumentRequest(agentDocumentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/agent-documents/{agentDocumentId}"
        let agentDocumentIdPreEscape = "\(agentDocumentId)"
        let agentDocumentIdPostEscape = agentDocumentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{agentDocumentId}", with: agentDocumentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Agent Documents

     - parameter expand: (query)  (optional, default to false)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listAgentDocuments(expand: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listAgentDocumentsRequest(expand: expand).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Agent Documents
     - GET /api/v1/agent-documents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter expand: (query)  (optional, default to false)

     - returns: RequestBuilder<Void> 
     */
    open class func listAgentDocumentsRequest(expand: Bool? = nil) -> RequestBuilder<Void> {
        let path = "/api/v1/agent-documents"
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
