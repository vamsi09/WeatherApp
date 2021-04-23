//
//  APICallManager.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import Foundation
import Alamofire

var apiKey = ""

class APIManager {
    
    //***************************************
    // MARK: - Variables
    //***************************************
    static let instance = APIManager()

    private init(){}

    //***************************************
    // MARK: - Country API
    //***************************************
    func callAPIGETWeather(city: String, onSuccess: @escaping([String:AnyObject]) -> Void, onFailure: @escaping(String) -> Void)
    {
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + apiKey
        BaseAPIService.instance.callGetService(url: url, onSuccess: { (resDict) in
            onSuccess(resDict)
        }) { (msg) in
            onFailure(msg)
        }
    }
    
    
}
