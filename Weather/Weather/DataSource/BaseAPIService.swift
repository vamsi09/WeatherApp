//
//  BaseAPIClass.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import Foundation
import Alamofire
// Remove sucess from error object so that we use sucess and failure for proper screen flow.

class BaseAPIService {
    
    //***************************************
    // MARK: - Variables
    //***************************************
    static let instance = BaseAPIService()
    
    
    //***************************************
    // MARK: - Get Webservice for dynamic links
    //***************************************
    func callGetService(url: String, onSuccess: @escaping([String:AnyObject]) -> Void, onFailure: @escaping(String) -> Void)
    {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer ",
            "Accept": "application/json",
            "User-Agent" : setUserAgent()
        ]
        let strURL = url.replacingOccurrences(of: " ", with: "%20")
        AF.request(strURL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            switch response.result {
            case .success(let result):
                print(result)
                
                if let resDict = result as? [String : AnyObject]{
                    
                    let responseCode = response.response?.statusCode
                    if responseCode == 404{
                        onFailure(response.response?.description ?? "Error")
                    }else {
                        onSuccess(resDict)
                    }
                }
            case .failure(let error):
                print(error)
                
                onFailure(error.errorDescription!)
            }
        }
    }
    
    //***************************************
    // MARK: - Get system details for passing User Agent in header
    //***************************************
    func setUserAgent() -> String{
        var displayName = ""
        var appVersion = ""
        var systemIosVersion = ""
        var finalUserAgent = ""
        
        if let name = Bundle.main.appName{
            displayName = name
        }
        
        if let version = Bundle.main.appVersion{
            appVersion = version
        }
        
        if let iosVersion = Bundle.main.systemIosVersion{
            systemIosVersion = iosVersion
        }
        
        if displayName.count > 0 && appVersion.count > 0 && systemIosVersion.count > 0{
            
            finalUserAgent = displayName + "/" + appVersion + " (iOS/" + systemIosVersion + ")"
        }
        return finalUserAgent
    }
}

extension Bundle {
    var appName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
    
    var appVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var systemIosVersion : String? {
        return UIDevice.current.systemVersion
    }
}
