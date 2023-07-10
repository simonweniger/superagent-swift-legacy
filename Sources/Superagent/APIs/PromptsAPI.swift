//
// PromptsAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class PromptsAPI {
    /**
     Create A Prompt

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createPrompt(body: Prompt, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		createPromptRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create A Prompt
     - POST /api/v1/prompts

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createPromptRequest(body: Prompt) -> RequestBuilder<Void> {
        let path = "/api/v1/prompts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Prompt

     - parameter promptId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deletePrompt(promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		deletePromptRequest(promptId: promptId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Prompt
     - DELETE /api/v1/prompts/{promptId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter promptId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deletePromptRequest(promptId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/prompts/{promptId}"
        let promptIdPreEscape = "\(promptId)"
        let promptIdPostEscape = promptIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{promptId}", with: promptIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Prompt

     - parameter promptId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getPrompt(promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		getPromptRequest(promptId: promptId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Prompt
     - GET /api/v1/prompts/{promptId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter promptId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getPromptRequest(promptId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/prompts/{promptId}"
        let promptIdPreEscape = "\(promptId)"
        let promptIdPostEscape = promptIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{promptId}", with: promptIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Prompts

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listPrompts(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listPromptsRequest().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Prompts
     - GET /api/v1/prompts

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listPromptsRequest() -> RequestBuilder<Void> {
        let path = "/api/v1/prompts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Patch Prompt

     - parameter body: (body)  
     - parameter promptId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updatePrompt(body: Any, promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		updatePromptRequest(body: body, promptId: promptId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Patch Prompt
     - PATCH /api/v1/prompts/{promptId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  
     - parameter promptId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func updatePromptRequest(body: Any, promptId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/prompts/{promptId}"
        let promptIdPreEscape = "\(promptId)"
        let promptIdPostEscape = promptIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{promptId}", with: promptIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
