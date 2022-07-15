//
//  ViewController.swift
//  dateCount
//
//  Created by CHOI on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var day1View: UIView!
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day3View: UIView!
    @IBOutlet weak var day4View: UIView!
    
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
        
        shadow(view: day1View, img: day1Img)
        shadow(view: day2View, img: day2Img)
        shadow(view: day3View, img: day3Img)
        shadow(view: day4View, img: day4Img)

    }
    
    func shadow(view: UIView, img: UIImageView) {
        view.layer.cornerRadius = 15
        img.layer.cornerRadius = 15
        
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowPath = nil
    }
    
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: Date()).day! + 1
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년 M월 d일"
        
        let startDate = datePicker.date
//        var daysCount: Int = days(from: startDate)
        
        func countDays(value: Int) -> String{
            let hundred = Calendar.current.date(byAdding: .day, value: value, to: startDate)!
            return format.string(from: hundred)
        }
        
        let result = format.string(from: datePicker.date)
        print("result", result)
        
        day1Day.text = countDays(value: 100)
        day2Day.text = countDays(value: 200)
        day3Day.text = countDays(value: 300)
        day4Day.text = countDays(value: 400)
        
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

