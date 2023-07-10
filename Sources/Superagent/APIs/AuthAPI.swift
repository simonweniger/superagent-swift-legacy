//
// AuthAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class AuthAPI {
    /**
     Sign In

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func signIn(body: SignIn, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		signInRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sign In
     - POST /api/v1/auth/sign-in
     - 

     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func signInRequest(body: SignIn) -> RequestBuilder<Void> {
        let path = "/api/v1/auth/sign-in"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Sign Up

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func signUp(body: SignUp, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		signUpRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sign Up
     - POST /api/v1/auth/sign-up
     - 

     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func signUpRequest(body: SignUp) -> RequestBuilder<Void> {
        let path = "/api/v1/auth/sign-up"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
