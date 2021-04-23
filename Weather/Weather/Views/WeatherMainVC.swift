//
//  MainVC.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import UIKit
import Foundation
import SwiftyJSON

class WeatherMainVC: UIViewController {

    @IBOutlet weak var btnLookUp: UIButton!
    @IBOutlet weak var txtCityName: UITextField!
    
    var presenterCity: WeatherPresenter?
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: city, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor.systemIndigo
        navigationItem.backBarButtonItem?.tintColor = .white
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.presenterCity = WeatherPresenter(delegate: self)
    }
    
    
    @IBAction func btnLookUpTapped(_ sender: UIButton) {
        
        if apiKey.isEmpty {
            
            let alert = UIAlertController(title: "API key missing", message: "Please add API key in APIManager class", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                  print("Handle Ok logic here")
            }))

            present(alert, animated: true, completion: nil)
            
            return
        }
        
        if let cname = txtCityName.text {
            city = cname
            
            navigationItem.backBarButtonItem = UIBarButtonItem(
                title: city, style: .plain, target: nil, action: nil)
            navigationController?.navigationBar.barTintColor = UIColor.systemIndigo
            navigationItem.backBarButtonItem?.tintColor = .white
            
            self.presenterCity?.getWeather(city: city)
        }
    }
    
}

extension WeatherMainVC: WeatherPresenterDelegate {
    
    func weatherDidSucceed(countryResponseModel: GetWeatherSuccess) {
        print(countryResponseModel)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier:"WeatherListVC" ) as! WeatherListVC
        vc.list = countryResponseModel.list
        vc.city = city
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func weatherDidFailed(message: String) {
        print(message)
        
        let alert = UIAlertController(title: "City Error", message: "City not gound.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
        }))

        present(alert, animated: true, completion: nil)

    }
    
    
}
