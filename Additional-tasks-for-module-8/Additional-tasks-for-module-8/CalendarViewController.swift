//
//  CalendarViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 17.02.2021.
//

import UIKit

class CalendarViewController: UIViewController {
    
    
    @IBOutlet weak var calendarDate: UIDatePicker!
    @IBOutlet weak var newTimeTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    var timeZone = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    @IBAction func changeLabel(_ sender: UIDatePicker) {
        
        let pickerDate = sender.date
        let calendar = Calendar.current
        let year = calendar.component(.year, from: pickerDate)
        let month = calendar.component(.month, from: pickerDate)
        let day = calendar.component(.day, from: pickerDate)
        let hour = calendar.component(.hour, from: pickerDate)
        let minute = calendar.component(.minute, from: pickerDate)
        let second = calendar.component(.second, from: pickerDate)
        
        if newTimeTextField.text?.isEmpty == true {
            guard let endDate = calendar.date(byAdding: .day, value: 0, to: pickerDate) else { return }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"// 'Time' HH:mm:ss"
            dateLabel.text = dateFormatter.string(from: endDate)
            
        }else {
            let el = Int(newTimeTextField.text!)
            if timeZone.contains(el!){
                let newHour = hour + el!
                dateLabel.text = "\(day)-\(month)-\(year) Time \(newHour):\(minute):\(second)"
                
            }
        }
    }
}
