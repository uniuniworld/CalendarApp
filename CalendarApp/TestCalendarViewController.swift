//
//  TestCalendarViewController.swift
//  CalendarApp
//
//  Created by Takahiro Kirifu on 2020/08/05.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import FSCalendar


class TestCalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.appearance.headerDateFormat = "MM月"

        // Do any additional setup after loading the view.
    }
    
    // メモリを使いすぎた時
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func week(_ sender: Any) {
        calendar.setScope(.week, animated: true)
    }
    @IBAction func month(_ sender: Any) {
        calendar.setScope(.month, animated: true)
    }
    
}

//extension FSCalendar: FSCalendarDelegate {
//
//}
//
//extension FSCalendar: FSCalendarDataSource {
//
//}
