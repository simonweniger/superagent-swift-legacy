//
// ApiTokenAPI.swift
//
//

import Foundation
import Alamofire


open class ApiTokenAPI {
    /**
     Create Api Token

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createAPITokenApiV1ApiTokensPost(body: ApiToken, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createAPITokenApiV1ApiTokensPostWithRequestBuilder(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Api Token
     - POST /api/v1/api-tokens

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createAPITokenApiV1ApiTokensPostWithRequestBuilder(body: ApiToken) -> RequestBuilder<Void> {
        let path = "/api/v1/api-tokens"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Api Token

     - parameter tokenId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteAPITokenApiV1ApiTokensTokenIdDelete(tokenId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteAPITokenApiV1ApiTokensTokenIdDeleteWithRequestBuilder(tokenId: tokenId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Api Token
     - DELETE /api/v1/api-tokens/{tokenId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter tokenId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteAPITokenApiV1ApiTokensTokenIdDeleteWithRequestBuilder(tokenId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/api-tokens/{tokenId}"
        let tokenIdPreEscape = "\(tokenId)"
        let tokenIdPostEscape = tokenIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{tokenId}", with: tokenIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Api Token

     - parameter tokenId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAPITokenApiV1ApiTokensTokenIdGet(tokenId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        getAPITokenApiV1ApiTokensTokenIdGetWithRequestBuilder(tokenId: tokenId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Api Token
     - GET /api/v1/api-tokens/{tokenId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter tokenId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getAPITokenApiV1ApiTokensTokenIdGetWithRequestBuilder(tokenId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/api-tokens/{tokenId}"
        let tokenIdPreEscape = "\(tokenId)"
        let tokenIdPostEscape = tokenIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{tokenId}", with: tokenIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Api Tokens

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listAPITokensApiV1ApiTokensGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listAPITokensApiV1ApiTokensGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Api Tokens
     - GET /api/v1/api-tokens

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listAPITokensApiV1ApiTokensGetWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/api/v1/api-tokens"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
