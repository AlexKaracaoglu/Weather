//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Alex Karacaoglu on 3/1/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather() {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        AF.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
