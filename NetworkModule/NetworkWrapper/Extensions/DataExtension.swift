//
//  SCData.swift
//  Runner
//
//  Created by Abhiraj on 04/05/20.
//  
//

import Foundation

extension Data {
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}
