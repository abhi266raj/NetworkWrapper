//
//  BaseNetworkManager.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//
//

import Foundation

typealias ResponseHandler<A> = (A?) -> Void


public class BaseNetworkManager: NSObject {

    public static let shared = BaseNetworkManager()
    
  
    
    func loadRequest<A>(resource: ApiResource<A>, completion: @escaping ResponseCallback<A>) {
        ApiBase.sharedWebClient.loadRequest(resource: resource) { response in
//            if let error = response.error {
//              
//                completion(response)
//            } else {
//                completion(response)
//            }
        }
    }

}
