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

class WeatherDetail: WeatherLocation {
    
    struct HourlyForecast {
        var hourlyTime: Double
        var hourlyTemperature: Double
        var hourlyPrecipProb: Double
        var hourlyIcon: String
    }
    
    struct DailyForecast {
        var dailyMaxTemp: Double
        var dailyMinTemp: Double
        var dailyDate: Double
        var dailySummary: String
        var dailyIcon: String
    }
    
    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    var dailyForecastArray = [DailyForecast]()
    var hourlyForecastArray = [HourlyForecast]()
    
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
                    self.currentSummary = summary
                }
                else {
                    print("Could not get the summary")
                }
                
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                }
                else {
                    print("Could not get the icon")
                }
                
                if let timeZone = json["timezone"].string {
                    self.timeZone = timeZone
                }
                else {
                    print("Could not get the timezone")
                }
                
                if let time = json["currently"]["time"].double {
                    self.currentTime = time
                }
                else {
                    print("Could not get the time")
                }
                
                let dailyDataArray = json["daily"]["data"]
                self.dailyForecastArray = []
                let days = min(7, dailyDataArray.count - 1)
                for day in 1...days {
                    let maxTemperature = dailyDataArray[day]["temperatureHigh"].doubleValue
                    let minTemperature = dailyDataArray[day]["temperatureLow"].doubleValue
                    let dateValue = dailyDataArray[day]["time"].doubleValue
                    let icon = dailyDataArray[day]["icon"].stringValue
                    let summary = dailyDataArray[day]["summary"].stringValue
                    let newDailyForecast = DailyForecast(dailyMaxTemp: maxTemperature, dailyMinTemp: minTemperature, dailyDate: dateValue, dailySummary: summary, dailyIcon: icon)
                    self.dailyForecastArray.append(newDailyForecast)
                }
                
                let hourlyDataArray = json["hourly"]["data"]
                self.hourlyForecastArray = []
                let hours = min(24, hourlyDataArray.count - 1)
                for hour in 1...hours {
                    let hourlyTime = hourlyDataArray[hour]["time"].doubleValue
                    let hourlyTemp = hourlyDataArray[hour]["temperature"].doubleValue
                    let hourlyPrecipProb = hourlyDataArray[hour]["precipProbability"].doubleValue
                    let hourlyIcon = hourlyDataArray[hour]["icon"].stringValue
                    let newHourlyForecast = HourlyForecast(hourlyTime: hourlyTime, hourlyTemperature: hourlyTemp, hourlyPrecipProb: hourlyPrecipProb, hourlyIcon: hourlyIcon)
                    self.hourlyForecastArray.append(newHourlyForecast)
                }
                
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
