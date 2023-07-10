//
// AuthAPI.swift
//
//

import Foundation
import Alamofire


open class AuthAPI {
    /**
     Sign In

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func signInApiV1AuthSignInPost(body: SignIn, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        signInApiV1AuthSignInPostWithRequestBuilder(body: body).execute { (response, error) -> Void in
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
    open class func signInApiV1AuthSignInPostWithRequestBuilder(body: SignIn) -> RequestBuilder<Void> {
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
    open class func signUpApiV1AuthSignUpPost(body: SignUp, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        signUpApiV1AuthSignUpPostWithRequestBuilder(body: body).execute { (response, error) -> Void in
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
    open class func signUpApiV1AuthSignUpPostWithRequestBuilder(body: SignUp) -> RequestBuilder<Void> {
        let path = "/api/v1/auth/sign-up"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
}
