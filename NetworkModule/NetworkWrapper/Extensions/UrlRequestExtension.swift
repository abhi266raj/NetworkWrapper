//
//  SCUrlRequest.swift
//  Runner
//
//  Created by Abhiraj on 04/05/20.
//  
//

import Foundation

extension URLRequest {
    init<A>(baseUrl: String, resource: ApiResource<A>) {
        let url = URL(baseUrl: baseUrl, resource: resource)
        self.init(url: url)
        httpMethod = resource.method.rawValue
        switch resource.method {
            case .post, .put:
                httpBody = try? JSONSerialization.data(withJSONObject: resource.params, options: [])
            default:
                break
        }
    }
}
