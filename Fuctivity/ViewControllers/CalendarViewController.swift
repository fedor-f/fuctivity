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
    
    let chillHoursViewController = ChillHourViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fuctivity"
        //navigationController?.navigationBar.backgroundColor = UIColorFromRGB(rgbValue: 0xaf95fc)

        setStyle()
        
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("Нажмите, чтобы распределить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        //button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(setEvents), for: .touchUpInside)
        button.setHeight(to: 80)
        button.backgroundColor = UIColorFromRGB(rgbValue: 0xeb943d)
        button.pinTop(to: self.dayView.dayHeaderView.bottomAnchor)
        button.pin(to: self.view, [.left: 0, .right: 0])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        //navigationController?.navigationBar.backgroundColor = UIColorFromRGB(rgbValue: 0xaf95fc)
    }
    
    @objc
    public func setEvents() {
        self.navigationController?.pushViewController(self.chillHoursViewController, animated: true)
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

