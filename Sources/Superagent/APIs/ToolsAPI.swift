//
// ToolsAPI.swift
//
//

import Foundation
import Alamofire


open class ToolsAPI {
    /**
     Create A Tool

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAToolApiV1ToolsPost(body: Tool, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createAToolApiV1ToolsPostWithRequestBuilder(body: body).execute { (response, error) -> Void in
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
    open class func createAToolApiV1ToolsPostWithRequestBuilder(body: Tool) -> RequestBuilder<Void> {
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
    open class func deleteToolApiV1ToolsToolIdDelete(toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteToolApiV1ToolsToolIdDeleteWithRequestBuilder(toolId: toolId).execute { (response, error) -> Void in
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
    open class func deleteToolApiV1ToolsToolIdDeleteWithRequestBuilder(toolId: String) -> RequestBuilder<Void> {
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
    open class func getToolApiV1ToolsToolIdGet(toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getToolApiV1ToolsToolIdGetWithRequestBuilder(toolId: toolId).execute { (response, error) -> Void in
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
    open class func getToolApiV1ToolsToolIdGetWithRequestBuilder(toolId: String) -> RequestBuilder<Void> {
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
    open class func listToolsApiV1ToolsGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listToolsApiV1ToolsGetWithRequestBuilder().execute { (response, error) -> Void in
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
    open class func listToolsApiV1ToolsGetWithRequestBuilder() -> RequestBuilder<Void> {
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
    open class func patchToolApiV1ToolsToolIdPatch(body: Any, toolId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        patchToolApiV1ToolsToolIdPatchWithRequestBuilder(body: body, toolId: toolId).execute { (response, error) -> Void in
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
    open class func patchToolApiV1ToolsToolIdPatchWithRequestBuilder(body: Any, toolId: String) -> RequestBuilder<Void> {
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
