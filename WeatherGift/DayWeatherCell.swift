//
//  DayWeatherCell.swift
//  WeatherGift
//
//  Created by Alex Karacaoglu on 3/2/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import UIKit

class DayWeatherCell: UITableViewCell {

    @IBOutlet weak var dayCellIcon: UIImageView!
    @IBOutlet weak var dayCellWeekday: UILabel!
    @IBOutlet weak var dayCellMaxTemp: UILabel!
    @IBOutlet weak var dayCellMinTemp: UILabel!
    @IBOutlet weak var dayCellSummary: UITextView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with dailyForecast: WeatherLocation.DailyForecast, timeZone: String) {
        dayCellIcon.image = UIImage(named: dailyForecast.dailyIcon)
        
        let usableDate = Date(timeIntervalSince1970: dailyForecast.dailyDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        dayCellWeekday.text = dateString
        
        dayCellSummary.text = dailyForecast.dailySummary
        dayCellMaxTemp.text = String(format: "%3.f", dailyForecast.dailyMaxTemp) + "°"
        dayCellMinTemp.text = String(format: "%3.f", dailyForecast.dailyMinTemp) + "°"
    }
    
    

}
