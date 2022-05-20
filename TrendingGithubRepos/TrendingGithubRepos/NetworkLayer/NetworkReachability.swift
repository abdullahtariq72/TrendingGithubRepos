//
//  NetworkReachability.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 19/05/2022.
//

import Foundation
import Alamofire

public class NetworkReachability {
    class func isConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager()!.isReachable
        
    }
    
}
