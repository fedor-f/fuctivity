//
//  ChillEvent.swift
//  Fuctivity
//
//  Created by Федор Филиппов on 10.12.2022.
//

import Foundation
import UIKit
import EventKit
import CalendarKit

class ChillEvent {
    public static var time: Int = 0
    
    public var description: String = ""
    public static var date: String = String()
    public var category: String = ""
    
    public static var categoryOfEvent: String = String()
    public static var eventDescription: String = String()
    public static var eventStorage: [Event] = []
}
