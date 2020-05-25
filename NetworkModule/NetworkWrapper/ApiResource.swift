//
//  ApiResource.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//  
//

import Foundation
//import Alamofire

public struct ApiResource<A> {
    let path: ApiPath
    let method: RequestMethod
    var headers: JSONDict
    var params: JSONDict
    let parser: (Data) -> A?
   
    public var commonParams: JSONDict = [:]

    init(pathString: String,
         method: RequestMethod = .get,
         params: JSONDict = [:],
         headers: JSONDict = [:],
         parse: @escaping (Data) -> A?,
         uploadData: Data? = nil,
         uploadFileUrl: URL? = nil) {
        
        self.path = ApiPath(pathString: pathString)
        self.method = method
        self.params = params
        self.headers = headers
        self.parser = parse
        self.appendCommonHeaders()
    }
    
    mutating func appendCommonHeaders() {
    
    }
    
    func resourceWithCommonParams(resource: ApiResource) -> ApiResource {
        var newResource = resource
        newResource.params = newResource.params.merging(commonParams) { spec, common in
            return spec
        }
        return newResource
    }
}

// Extension to handle custom or modified ApiResource.
//extension ApiResource where A: Decodable, B: Decodable {
//    init(pathString: String,
//         method: RequestMethod = .get,
//         params: JSONDict = [:],
//         headers: HTTPHeaders = [:]) {
//        let jsonDecoder = JSONDecoder()
//        var newHeaders = headers
//        newHeaders["Accept"] = "application/json"
//        
//        self.path = ApiPath(pathString: pathString)
//        self.method = method
//        self.params = params
//        self.headers = newHeaders
//        self.parse = {
//            do {
//                return try jsonDecoder.decode(A.self, from: $0)
//            } catch {
//                DebugLogger.log(text: "Error: \(error.localizedDescription)")
//                return nil
//            }
//        }
//        self.parseError = {
//            do {
//                return try jsonDecoder.decode(B.self, from: $0)
//            } catch {
//                DebugLogger.log(text: "Error: \(error.localizedDescription)")
//                return nil
//            }
//        }
//        self.appendCommonHeaders()
//    }
//    init(path: Path,
//         method: RequestMethod = .get,
//         params: JSONDict = [:],
//         headers: HTTPHeaders = [:]) {
//        let jsonDecoder = JSONDecoder()
//        var newHeaders = headers
//        newHeaders["Accept"] = "application/json"
//        
//        self.path = ApiPath(path)
//        self.method = method
//        self.params = params
//        self.headers = newHeaders
//        self.parse = {
//            do {
//                return try jsonDecoder.decode(A.self, from: $0)
//            } catch {
//                DebugLogger.log(text: "Error: \(error.localizedDescription)")
//                return nil
//            }
//        }
//        self.parseError = {
//            do {
//                return try jsonDecoder.decode(B.self, from: $0)
//            } catch {
//                DebugLogger.log(text: "Error: \(error.localizedDescription)")
//                return nil
//            }
//        }
//        self.appendCommonHeaders()
//    }
//    
//    init(path: Path,
//         method: RequestMethod = .get,
//         params: JSONDict = [:],
//         headers: HTTPHeaders = [:],
//         parse: @escaping (Data) -> A?,
//         parseError: @escaping (Data) -> B?,
//         uploadData: Data? = nil,
//         uploadFileUrl: URL? = nil) {
//        
//        self.path = ApiPath(path)
//        self.method = method
//        self.params = params
//        self.headers = headers
//        self.parse = parse
//        self.parseError = parseError
//        self.uploadData = uploadData
//        self.uploadFileUrl = uploadFileUrl
//        self.appendCommonHeaders()
//    }
//}
