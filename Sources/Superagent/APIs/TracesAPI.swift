//
// TracesAPI.swift
//
//

import Foundation
import Alamofire


open class TracesAPI {
    /**
     List Agent Traces

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listAgentTracesApiV1TracesGet(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        listAgentTracesApiV1TracesGetWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Agent Traces
     - GET /api/v1/traces

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listAgentTracesApiV1TracesGetWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/api/v1/traces"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
