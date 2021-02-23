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
    
    @IBAction func changeLabel() {
        
        let pickerDate = calendarDate.date
        let calendar = Calendar.current
        let timezoneValue = Int(newTimeTextField.text ?? "") ?? 0
        let endDate = calendar.date(byAdding: .hour, value: timezoneValue, to: pickerDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy 'Time' HH:mm:ss"
        dateLabel.text = dateFormatter.string(from: endDate!)
    }
}
