//
//  TestCalendarViewController.swift
//  CalendarApp
//
//  Created by Takahiro Kirifu on 2020/08/05.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import FSCalendar


class TestCalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate {

    
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var animationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        calendar.appearance.headerDateFormat = "MM月"
        
        // Do any additional setup after loading the view.
    }
    
    // メモリを使いすぎた時
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpData = Calendar(identifier: .gregorian)
        let year = tmpData.component(.year, from: date)
        let month = tmpData.component(.month, from: date)
        let day = tmpData.component(.day, from: date)
        label.text = "\(year)/\(month)/\(day)"
        self.calendar.scope = .week
        
    }
    
    @IBAction func selectToday(_ sender: Any) {
        
        self.calendar.select(Date())
        label.text = "\(Date())"
        
    }
    
    @IBAction func `switch`(_ sender: Any) {
        if self.animationSwitch.isOn {
            calendar.scrollDirection = .horizontal
            print("on")
        } else {
            calendar.scrollDirection = .vertical
            print("off")
        }
    }
    
    // MARK:- UITableViewDataSource
    
    /*
     tableViewのセクション数
     このメソッドを実装しない場合は、セクションは１つでテーブルを構成する
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     必須 行数
     tabaleViewの指定されたセクションの行数を返すようにDataSourceに指示する。
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            
        }
    }
    
    
    // MARK:- toggleClicked
    @IBAction func toggleClicked(_ sender: Any) {
        if self.calendar.scope == .month {
            self.calendar.setScope(.week, animated: self.animationSwitch.isOn)
            //self.calendar.scope = .week
            print("week")
        } else {
            self.calendar.setScope(.month, animated: self.animationSwitch.isOn)
            //self.calendar.scope = .month
            print("month")
        }
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
//
//extension TestCalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
//


