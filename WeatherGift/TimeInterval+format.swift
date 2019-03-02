//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Alex Karacaoglu on 3/2/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
    
}
