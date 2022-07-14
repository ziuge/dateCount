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
        
        datePickerValueChanged(datePicker)
        
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
    
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: Date()).day! + 1
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년 M월 d일"
        
        let startDate = datePicker.date
        var daysCount: Int = days(from: startDate)
        let hundred = Calendar.current.date(byAdding: .day, value: 100, to: startDate)
        
        print("hundred", hundred)
        
        
        let result = format.string(from: datePicker.date)
        print("result", result)
        
        day1Day.text = result
        day2Day.text = result
        day3Day.text = result
        day4Day.text = result
        
        
        
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

