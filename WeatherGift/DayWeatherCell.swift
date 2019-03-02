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
    
    

}
