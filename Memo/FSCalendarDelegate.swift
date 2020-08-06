////
////  FSCalendarDelegate.swift
////  CalendarApp
////
////  Created by Takahiro Kirifu on 2020/08/06.
////  Copyright © 2020 Takahiro Kirifu. All rights reserved.
////
//
//import Foundation
//
///**
//Asks the delegate whether the specific date is allowed to be selected by tapping.
//特定の日付をタップして選択できるかどうかをデリゲートに尋ねます。
//*/
//shouldSelectData
//
//import UIKit
//import FSCalendar
//
//class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
//
//    var drawingHeight : CGFloat = 0.0
//    @IBOutlet weak var calendarView: FSCalendar!
//    @IBOutlet weak var calendarViewHeight: NSLayoutConstraint!
//
//    override func viewDidLoad() {
//        let a = self.view.frame.height
//        let b = self.navigationController?.navigationBar.frame.height
//        let c = self.tabBarController?.tabBar.frame.height
//        let d = UIApplication.shared.statusBarFrame.height
//        self.drawingHeight = a - b! - c! - d
//
//        // gesture settings
//        let swipUpGesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer(
//            target: self,
//            action: #selector(ListViewController.swipUp))
//        swipUpGesture.direction = .up
//        let swipDownGesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer(
//            target: self,
//            action: #selector(ListViewController.swipDown))
//        swipDownGesture.direction = .down
//        self.calendarView.addGestureRecognizer(swipUpGesture)
//        self.calendarView.addGestureRecognizer(swipDownGesture)
//    }
//
//    // MARK: -- gesture Recognition
//    @objc func swipUp() {
//        print("swiped up")
//        if self.calendarViewHeight.constant == self.drawingHeight {
//            self.calendarViewHeight.constant = self.drawingHeight * 0.5
//            self.view.updateConstraintsIfNeeded()
//        } else if self.calendarViewHeight.constant == self.drawingHeight * 0.5 {
//            self.calendarView.setScope(.week, animated: false)
//            self.calendarViewHeight.constant = self.drawingHeight * 0.25
//            self.view.updateConstraintsIfNeeded()
//        } else {
//            // UIAlert
//        }
//    }
//
//    @objc func swipDown() {
//        print("swiped down")
//        if self.calendarViewHeight.constant == self.drawingHeight * 0.25 {
//            self.calendarView.setScope(.month, animated: false)
//            self.calendarViewHeight.constant = self.drawingHeight * 0.5
//            self.view.updateConstraintsIfNeeded()
//        } else if self.calendarViewHeight.constant == self.drawingHeight * 0.5 {
//            self.calendarViewHeight.constant = self.drawingHeight
//            self.view.updateConstraintsIfNeeded()
//        } else {
//            // 何もないときはできないよ
//        }
//    }
//
//}
