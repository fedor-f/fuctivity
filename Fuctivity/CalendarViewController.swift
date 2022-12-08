//
//  CalendarViewController.swift
//  Fuctivity
//
//  Created by Федор Филиппов on 08.12.2022.
//

import Foundation
import UIKit
import CalendarKit

class CalendarViewController: DayViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fuctivity"

        setStyle()
    }
    
    func setStyle() {
        let color = UIColorFromRGB(rgbValue: 0xaf95fc)
        var style = CalendarStyle()
        style.timeline.separatorColor = .white
        style.timeline.backgroundColor = .systemGray5
        style.header.backgroundColor = color
        style.header.daySelector.selectedBackgroundColor = .orange
        style.header.daySelector.todayActiveBackgroundColor = .orange
        
        style.header.separatorColor = color
        self.updateStyle(style)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

