//
//  ApiPath.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//  
//

import Foundation

struct ApiPath {
    private var components: [String]
    
    var absolutePath: String {
        return "/" + components.joined(separator: "/")
    }
    
    init(pathString: String) {
        components = pathString.components(separatedBy: "/").filter({ !$0.isEmpty })
    }
    
//    init(_ path: Path) {
//        components = path.rawValue.components(separatedBy: "/").filter({ !$0.isEmpty })
//    }
    
    mutating func append(path: ApiPath) {
        components += path.components
    }
    
    func appending(path: ApiPath) -> ApiPath {
        var copy = self
        copy.append(path: path)
        return copy
    }
}
