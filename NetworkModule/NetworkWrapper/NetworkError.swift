//
//  NetworkError.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//  
//

import Foundation

public enum NetworkError: Error {
    case noInternetConnection
    case custom(String)
    case unauthorized
    case noserverResponse
    case other
}

