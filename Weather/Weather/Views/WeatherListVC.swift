//
//  WeatherListVC.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import UIKit
import SwiftyJSON

class WeatherListVC: UIViewController {
    
    @IBOutlet weak var tblWeather: UITableView!
    
    var list = [List]()
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: city, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor.systemIndigo
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}

extension WeatherListVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else {
            return UITableViewCell()
        }

        let celsiusTemp = self.list[indexPath.row].main.temp - 273.15
        let fahrenheit = (celsiusTemp * 9.0) / 5.0 + 32.0
        cell.lblTemp.text = "Temp: " + String(format: "%.0f", fahrenheit)
        cell.lblWeatherCell.text = self.list[indexPath.row].weather[0].main
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier:"WeatherDetailedVC" ) as! WeatherDetailedVC
        vc.detailedList = self.list[indexPath.row]
        vc.city = city
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
