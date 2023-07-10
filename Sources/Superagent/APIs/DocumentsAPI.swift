//
// DocumentsAPI.swift
//
//  Created by Simon Weniger on 09.07.23.
//

import Foundation
import Alamofire


open class DocumentsAPI {
    /**
     Create Document

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createDocuments(body: Document, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        createDocumentsRequest(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Create Document
     - POST /api/v1/documents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func createDocumentsRequest(body: Document) -> RequestBuilder<Void> {
        let path = "/api/v1/documents"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }
    /**
     Delete Document

     - parameter documentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteDocument(documentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		deleteDocumentRequest(documentId: documentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Document
     - DELETE /api/v1/documents/{documentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter documentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteDocumentRequest(documentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/documents/{documentId}"
        let documentIdPreEscape = "\(documentId)"
        let documentIdPostEscape = documentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{documentId}", with: documentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get Document

     - parameter documentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDocument(documentId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		getDocumentRequest(documentId: documentId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Get Document
     - GET /api/v1/documents/{documentId}

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]
     - parameter documentId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func getDocumentRequest(documentId: String) -> RequestBuilder<Void> {
        var path = "/api/v1/documents/{documentId}"
        let documentIdPreEscape = "\(documentId)"
        let documentIdPostEscape = documentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{documentId}", with: documentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     List Documents

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func listDocuments(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
		listDocumentsRequest().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     List Documents
     - GET /api/v1/documents

     - :
       - type: http
       - name: JWTBearer
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<Void> 
     */
    open class func listDocumentsRequest() -> RequestBuilder<Void> {
        let path = "/api/v1/documents"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
