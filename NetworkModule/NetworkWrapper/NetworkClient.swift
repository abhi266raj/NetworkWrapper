//
//  NetworkRequest.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//  
//

import Foundation
//import Alamofire

public typealias JSONDict = [String: Any]
public typealias ResponseCallback<A> = (Result<A,Error>) ->()

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class NetworkClient {
    private var baseUrl: String = ""
    
    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    public func loadRequest<A>(resource: ApiResource<A>,
                                     completion: @escaping ResponseCallback<A>) -> Void {
        let request = URLRequest(baseUrl: baseUrl, resource: resource)

//        AF.request(request.url!,
//                   method: HTTPMethod(rawValue: resource.method.rawValue),
//                   parameters: params,
//                   encoding: encoding,
//                   headers: resource.headers).response { (response) in
//            if let serverResponse = response.response {
//                if (200..<300) ~= serverResponse.statusCode {
//                    self.handleResponseData(response: response.data)
//                    completion(SCResult(value: response.data.flatMap(resource.parse), or: .other))
//                } else if serverResponse.statusCode == 401 {
//                    completion(.failure(.unauthorized))
//                } else {
//                    completion(.failure(response.data.flatMap(resource.parseError).map({.custom($0)}) ?? .other))
//                }
//            }else{
//                 completion(.failure(.noserverResponse))
//            }
//        }
   }
    
//    public func uploadRequest<A, SCError>(isMultipart: Bool, fileName:String?, resource: ApiResource<A, SCError>,
//                                                completion: @escaping (SCResult<A, SCError>) ->()) -> Void {
//
//        let request = URLRequest(baseUrl: baseUrl, resource: resource)
//
//        guard let uploadData = resource.uploadData else {
//            return
//        }
//
//        if isMultipart {
//            AF.upload(multipartFormData: { multipartFormData in
//                if resource.uploadFileUrl != nil {
//                    multipartFormData.append(resource.uploadFileUrl!, withName: fileName ?? "")
//                }
//                else {
//                    multipartFormData.append(uploadData, withName: fileName ?? "")
//                }
//            }, to: request.url!)
//                .responseJSON { response in
//            }
//        }else if (resource.uploadFileUrl != nil) {
////          Ex:  let fileURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!
//            AF.upload(resource.uploadFileUrl!, to: request.url!).responseJSON { response in
//
//            }
//        }else {
//            AF.upload(uploadData, to: request.url!).responseJSON { response in
//
//            }
//        }
//    }
//
    /*
    Example for destination:
        let destination: DownloadRequest.Destination = { _, _ in
        let documentsURL = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("image.png")
        
        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
     */
//    public func downloadRequest<A, SCError>(destination: @escaping DownloadRequest.Destination, resource: ApiResource<A, SCError>,
//                                                downloadProgres: @escaping (ProgressHandler),
//                                                completion: @escaping (SCResult<A, SCError>) ->()) -> Void {
//
//        let request = URLRequest(baseUrl: baseUrl, resource: resource)
//
//        AF.download(request.url!, method: request.method ?? .get, parameters: resource.params, headers: request.headers, to: destination)
//            .downloadProgress { progress in
//                DebugLogger.log(text:"Download Progress: \(progress.fractionCompleted)")
//                downloadProgres(progress)
//        }
//        .response { response in
//            if response.error == nil, let imagePath = response.fileURL?.path {
//                _ = UIImage(contentsOfFile: imagePath)
//            }
//        }
//    }
    
    private func handleResponseData(response: Data?) {
        switch ApiBase.sharedApiBase.environment {
        case .Staging, .Custom, .RestApi:
                self.printResponse(responseData: response, isPrintEnabled: true)
        case .Production:
            break
        }
    }
    
    private func printResponse(responseData: Data?, isPrintEnabled:Bool) {
        if(isPrintEnabled && responseData != nil) {
            do {
                let todoJSON = try JSONSerialization.jsonObject(with: responseData!, options: []) as? [String: Any]
                self.debugPrint(message: "\n ----- Response: \n \(String(describing: todoJSON))");
            } catch {
                // error trying to convert the data to JSON using JSONSerialization.jsonObject
            }
        }
    }
    
    private func debugPrint(message: String) {
//        DebugLogger.log(text: "//================== API ===================//")
//        DebugLogger.log(text: message)
//        DebugLogger.log(text: "//==========================================//")
    }
}
