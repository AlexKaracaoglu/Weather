//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Alex Karacaoglu on 3/1/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var summary = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        AF.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = String(roundedTemp + "°")
                }
                else {
                    print("Could not get the temp")
                }
                
                if let summary = json["currently"]["summary"].string {
                    self.summary = summary
                }
                else {
                    print("Could not get the summary")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
