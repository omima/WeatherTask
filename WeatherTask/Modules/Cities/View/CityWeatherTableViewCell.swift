//
//  CityWeatherTableViewCell.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with city: CityWeather) {
        cityName.text = city.cityWrapper?.name
        temp.text = "\(Int(city.temp)) °"
    }
}
