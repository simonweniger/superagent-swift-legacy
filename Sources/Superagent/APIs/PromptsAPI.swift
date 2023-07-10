//
// PromptsAPI.swift
//
//

import Foundation
import Alamofire


open class PromptsAPI {
    /**
     Create A Prompt

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAPromptApiV1PromptsPost(body: Prompt, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createAPromptApiV1PromptsPostWithRequestBuilder(body: body).execute { (response, error) -> Void in
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
    open class func createAPromptApiV1PromptsPostWithRequestBuilder(body: Prompt) -> RequestBuilder<Void> {
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
    open class func deletePromptApiV1PromptsPromptIdDelete(promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deletePromptApiV1PromptsPromptIdDeleteWithRequestBuilder(promptId: promptId).execute { (response, error) -> Void in
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
    open class func deletePromptApiV1PromptsPromptIdDeleteWithRequestBuilder(promptId: String) -> RequestBuilder<Void> {
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
    open class func getPromptApiV1PromptsPromptIdGet(promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getPromptApiV1PromptsPromptIdGetWithRequestBuilder(promptId: promptId).execute { (response, error) -> Void in
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
    open class func getPromptApiV1PromptsPromptIdGetWithRequestBuilder(promptId: String) -> RequestBuilder<Void> {
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
    open class func listPromptsApiV1PromptsGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listPromptsApiV1PromptsGetWithRequestBuilder().execute { (response, error) -> Void in
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
    open class func listPromptsApiV1PromptsGetWithRequestBuilder() -> RequestBuilder<Void> {
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
    open class func patchPromptApiV1PromptsPromptIdPatch(body: Any, promptId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        patchPromptApiV1PromptsPromptIdPatchWithRequestBuilder(body: body, promptId: promptId).execute { (response, error) -> Void in
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
    open class func patchPromptApiV1PromptsPromptIdPatchWithRequestBuilder(body: Any, promptId: String) -> RequestBuilder<Void> {
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
