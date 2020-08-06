//
//  TestCalendarViewController.swift
//  CalendarApp
//
//  Created by Takahiro Kirifu on 2020/08/05.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import FSCalendar


class TestCalendarViewController: UIViewController {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.appearance.headerDateFormat = "MM月"
        
        calendar.scrollDirection = .vertical
        
        // Do any additional setup after loading the view.
    }
    
    // メモリを使いすぎた時
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func week(_ sender: Any) {
        calendar.scope = .week
    }
    @IBAction func month(_ sender: Any) {
        calendar.scope = .month
    }
    
}

//extension TestCalendarViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return 1
//    }
//
//
//
//
//
//}

extension TestCalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpData = Calendar(identifier: .gregorian)
        let year = tmpData.component(.year, from: date)
        let month = tmpData.component(.month, from: date)
        let day = tmpData.component(.day, from: date)
        print("\(year)/\(month)/\(day)")
    }
}
