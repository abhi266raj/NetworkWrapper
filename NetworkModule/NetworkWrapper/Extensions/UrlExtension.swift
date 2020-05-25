//
//  SCUrl.swift
//  Runner
//
//  Created by Abhiraj on 04/05/20.
//  
//

import Foundation

extension URL {
    init<A>(baseUrl: String, resource: ApiResource<A>) {
        var components = URLComponents(string: baseUrl)!
        let resourceComponents = URLComponents(string: resource.path.absolutePath)!
        
        components.path = ApiPath(pathString: components.path).appending(path: ApiPath(pathString: resourceComponents.path)).absolutePath
        components.queryItems = resourceComponents.queryItems
        
        switch resource.method {
            case .get, .delete:
                var queryItems = components.queryItems ?? []
                queryItems.append(contentsOf: resource.params.map {
                    URLQueryItem(name: $0.key, value: String(describing: $0.value))
                })
                components.queryItems = queryItems
            default:
                break
        }
        
        self = components.url!
    }
}
