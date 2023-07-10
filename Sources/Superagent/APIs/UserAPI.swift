//
// UserAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class UserAPI {
    /**
     Read User

     - parameter userId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func readUser(userId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		readUserRequest(userId: userId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Read User
     - GET /api/v1/users/{userId}
     - 

     - examples: [{contentType=application/json, example=""}]
     - parameter userId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func readUserRequest(userId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/users/{userId}"
        let userIdPreEscape = "\(userId)"
        let userIdPostEscape = userIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{userId}", with: userIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Read User Me

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func readUserMe(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		readUserMeRequest().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Read User Me
     - GET /api/v1/users/me
     - 

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func readUserMeRequest() -> RequestBuilder<Void> {
        let path = "/api/v1/users/me"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
