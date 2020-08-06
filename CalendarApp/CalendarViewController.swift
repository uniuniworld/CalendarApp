//
//  CalendarViewController.swift
//  CalendarApp
//
//  Created by Takahiro Kirifu on 2020/08/05.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {


    @IBOutlet weak var calendar: FSCalendar!
    
    let week = ["日", "月", "火", "水", "木", "金", "土"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.setScope(.week, animated: true)
        
        let week = ["日", "月", "火", "水", "木", "金", "土"]
        for i in 0 ..< week.count {
            calendar.calendarWeekdayView.weekdayLabels[i].text = week[i]
        }

        
    }
    
    
    @objc func swipUp() {
        self.calendar.setScope(.week, animated: false)
    }
    
    // メモリを使いすぎた時
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func week(_ sender: Any) {
        calendar.setScope(.week, animated: true)
        
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    //fileprivate var dataFormatter = {let formatter = DataFormatter()}
    
}
