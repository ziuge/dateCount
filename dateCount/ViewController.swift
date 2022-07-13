//
//  ViewController.swift
//  dateCount
//
//  Created by CHOI on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var day1Img: UIImageView!
    @IBOutlet weak var day2Img: UIImageView!
    @IBOutlet weak var day3Img: UIImageView!
    @IBOutlet weak var day4Img: UIImageView!
    
    @IBOutlet weak var day1D: UILabel!
    @IBOutlet weak var day2D: UILabel!
    @IBOutlet weak var day3D: UILabel!
    @IBOutlet weak var day4D: UILabel!
    
    @IBOutlet weak var day1Day: UILabel!
    @IBOutlet weak var day2Day: UILabel!
    @IBOutlet weak var day3Day: UILabel!
    @IBOutlet weak var day4Day: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.datePickerMode = .date
        }
        
        if #available(iOS 15.0, *) {
            dateFormatStyle()
            numberFormatStyle()
        }
    }
    
    @available(iOS 15.0, *)
    func dateFormatStyle() {
        let value = Date()
        
        print(value)
        print(value.formatted())
        print(value.formatted(date: .omitted, time: .shortened))
        print(value.formatted(date: .complete, time: .shortened))
        print(value.formatted(date: .abbreviated, time: .shortened))
        
        let locale = Locale(identifier: "ko-KR")
        
        let result =
        value.formatted(.dateTime.locale(locale).day().month(.twoDigits).year())
        print("result", result)
        
        let result2 = value.formatted(.dateTime.day().month(.twoDigits).year( ))
        print("result2", result2)
    }

    @available(iOS 15.0, *)
    func numberFormatStyle() {
        print(50.formatted(.percent))
        
        print(1234567890.formatted())
        
        print(1234567890.formatted(.currency(code: "krw")))
        
        let result = ["고래밥", "칙촉", "지우개"].formatted()
        print(result)
    }

}

