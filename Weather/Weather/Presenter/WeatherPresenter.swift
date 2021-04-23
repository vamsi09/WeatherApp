//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import Foundation

@objc protocol WeatherPresenterDelegate{
    func weatherDidSucceed(countryResponseModel: GetWeatherSuccess)
    func weatherDidFailed(message: String)
}

class WeatherPresenter{
    
    //***************************************
    // MARK: - Variables
    //***************************************
    var delegate: WeatherPresenterDelegate
    
    init(delegate: WeatherPresenterDelegate) {
        self.delegate = delegate
    }
    
    //***************************************
    // MARK: - Get Country  API Requests
    //***************************************
    func getWeather(city: String){
        
        WeatherService.instance.callgetWeatherAPI(city: city, onSuccess: { (regData) in
            self.delegate.weatherDidSucceed(countryResponseModel: regData)
        }) { (msg) in
            self.delegate.weatherDidFailed(message: msg)
        }
    }
}
