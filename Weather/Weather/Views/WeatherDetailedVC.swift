//
//  WeatherDetailedVC.swift
//  Weather
//
//  Created by Vamsi on 4/22/21.
//

import UIKit

class WeatherDetailedVC: UIViewController {

    @IBOutlet weak var lblTempMain: UILabel!
    @IBOutlet weak var lblTempSub: UILabel!
    @IBOutlet weak var lblWeatherMain: UILabel!
    @IBOutlet weak var lblWeatherSub: UILabel!
    
    var detailedList:List? = nil
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: city, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor.systemIndigo
        navigationItem.backBarButtonItem?.tintColor = .white
        setWeatherDetails()
    }
    
    func setWeatherDetails(){
        
        let celsiusTemp = (self.detailedList?.main.temp ?? 0) - 273.15
        let fahrenheit = (celsiusTemp * 9.0) / 5.0 + 32.0
        lblTempMain.text = String(format: "%.0f", fahrenheit)
        
        let celsiusTemp2 = (self.detailedList?.main.feelsLike ?? 0) - 273.15
        let fahrenheit2 = (celsiusTemp2 * 9.0) / 5.0 + 32.0
        lblTempSub.text = "Feels Like: " + String(format: "%.0f", fahrenheit2)

        lblWeatherMain.text = self.detailedList?.weather[0].main
        lblWeatherSub.text = self.detailedList?.weather[0].descriptionField
    }
}
