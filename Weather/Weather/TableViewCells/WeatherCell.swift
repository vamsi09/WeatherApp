//
//  WeatherCell.swift
//  Weather
//
//  Created by Vamsi on 4/21/21.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var lblWeatherCell: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
