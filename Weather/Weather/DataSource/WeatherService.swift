//
//  WeatherService.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import Foundation

class WeatherService  {
    
    //***************************************
    // MARK: - Variables
    //***************************************
    static let instance = WeatherService()
    
    //***************************************
    // MARK: - Check Country API
    //***************************************
    public func callgetWeatherAPI(city: String, onSuccess: @escaping(GetWeatherSuccess) -> Void, onFailure: @escaping(String) -> Void) {
        
        APIManager.instance.callAPIGETWeather(city: city, onSuccess: { (resDict) in
            let regData = GetWeatherSuccess(fromDictionary: resDict)
            onSuccess(regData)
        }) { (msg) in
            onFailure(msg)
        }
    }
}
