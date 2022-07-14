//
//  PracticeViewController.swift
//  dateCount
//
//  Created by CHOI on 2022/07/14.
//

import UIKit

class PracticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // DateFormatter: 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "M월 d일, yy년"
//        format.locale
        
        let result = format.string(from: Date())
        print(result, Date())
        
        let word = "3월 2일, 19년"
        let dateResult = format.date(from: word)
        print(dateResult)
        
        
    }
    

}
