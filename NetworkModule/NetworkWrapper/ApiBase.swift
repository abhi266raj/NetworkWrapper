//
//  ApiBase.swift
//  Runner
//
//  Created by Abhiraj on 22/04/20.
//  
//

import Foundation
import UIKit

let kConfigurationKey = "Configuration"
let kDebugSchema = "Debug"
let kStaging = "Staging"
let kCustom = "Custom"

enum Environment: String {
    case Staging = "staging"
    case Custom = "custom"
    case Production = "production"
    case RestApi = "restapi"
    
    var baseURL: String {
        switch self {
            case .Staging:
                return "https://apis.staging.sharechat.com/"
            case .RestApi:
                return "https://restapi1.sharechat.com/"
            case .Custom:
                return "https://apis.staging.sharechat.com/"
            case .Production:
                return "https://apis.sharechat.com/ux-service/v1/"
        }
    }
}

struct ApiBase {
    public static var sharedApiBase = ApiBase()

    lazy var environment: Environment = {
        /*  This will fetch the running configuration based on schema
            which is Debug, Release and we can define additional schema in future.
            Currently Flutter allows Debug, Release and Profile in simulator.
         */
        if let configuration = Bundle.main.object(forInfoDictionaryKey: kConfigurationKey) as? String {
            if configuration.range(of: kDebugSchema) != nil {
                return Environment.RestApi
            }
        }
        return Environment.RestApi
    }()
    
    // Base URL can be changed directly using Environment.Production.baseURL
    public static let sharedWebClient = NetworkClient.init(baseUrl: sharedApiBase.environment.baseURL)

}

