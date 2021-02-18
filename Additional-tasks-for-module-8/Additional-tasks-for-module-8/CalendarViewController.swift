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
        
        let timezoneValue = Int(newTimeTextField.text ?? "") ?? 0
        let endDate = calendar.date(byAdding: .hour, value: timezoneValue, to: pickerDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy 'Time' HH:mm:ss"
        dateLabel.text = dateFormatter.string(from: endDate!)
        
    }
}
