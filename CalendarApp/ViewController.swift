//
//  ViewController.swift
//  CalendarApp
//
//  Created by Takahiro Kirifu on 2020/10/13.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self

        calendar.clipsToBounds = false
        calendar.appearance.separators = .interRows
        
        calendar.appearance.borderRadius = 0
        
        //calendar.monthPosition(for: <#T##FSCalendarCell#>)

        calendar.appearance.headerDateFormat = "MM月"
        
        let week = ["日", "月", "火", "水", "木", "金", "土"]
        for i in 0 ..< week.count {
            calendar.calendarWeekdayView.weekdayLabels[i].text = week[i]
        }
        
        calendar.scrollDirection = .vertical
        //calendar.pagingEnabled = false
        
       
        // color
        //calendar.appearance.eventSelectionColor = .blue
        
        // Do any additional setup after loading the view.
    }

}

extension ViewController: FSCalendarDataSource {
    

    
    
}

extension ViewController: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpData = Calendar(identifier: .gregorian)
        let year = tmpData.component(.year, from: date)
        let month = tmpData.component(.month, from: date)
        let day = tmpData.component(.day, from: date)
        print("\(year)/\(month)/\(day)")
        //self.calendar.scope = .week
    }
    
}
extension ViewController: FSCalendarDelegateAppearance {
    
}
