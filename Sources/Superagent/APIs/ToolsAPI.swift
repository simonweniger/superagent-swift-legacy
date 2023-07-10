//
// ToolsAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class ToolsAPI {
    /**
     Create A Tool

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createTool(body: Tool, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createToolRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create A Tool
     - POST /api/v1/tools

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createToolRequest(body: Tool) -> RequestBuilder<Void> {
        let path = "/api/v1/tools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Tool

     - parameter toolId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteTool(toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		deleteToolRequest(toolId: toolId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Tool
     - DELETE /api/v1/tools/{toolId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter toolId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteToolRequest(toolId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/tools/{toolId}"
        let toolIdPreEscape = "\(toolId)"
        let toolIdPostEscape = toolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{toolId}", with: toolIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Tool

     - parameter toolId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTool(toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		getToolRequest(toolId: toolId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Tool
     - GET /api/v1/tools/{toolId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter toolId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getToolRequest(toolId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/tools/{toolId}"
        let toolIdPreEscape = "\(toolId)"
        let toolIdPostEscape = toolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{toolId}", with: toolIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Tools

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listTools(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		listToolsRequest().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Tools
     - GET /api/v1/tools

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listToolsRequest() -> RequestBuilder<Void> {
        let path = "/api/v1/tools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Patch Tool

     - parameter body: (body)  
     - parameter toolId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateTool(body: Any, toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		updateToolRequest(body: body, toolId: toolId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Patch Tool
     - PATCH /api/v1/tools/{toolId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  
     - parameter toolId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func updateToolRequest(body: Any, toolId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/tools/{toolId}"
        let toolIdPreEscape = "\(toolId)"
        let toolIdPostEscape = toolIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{toolId}", with: toolIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
