//
//  TableViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 17.12.2020.
//

import UIKit

struct Content{
    var number = ""
    var names:[String] = []
}

class ContentTable {
    var cellTable1 = FirstCell(iconImage: "1-1", tuning: "Авиарежим")
    var cellTable2 = SecondCell(iconImage: "1-2", tuning: "WI-FI")
    var cellTable3 = SecondCell(iconImage: "1-3", tuning: "Bluetooth")
    var cellTable4 = ThirdCell(iconImage: "1-4", tuning: "Сотовая связь")
    var cellTable5 = ThirdCell(iconImage: "1-5", tuning: "Режим модема")
    var cellTable6 = ThirdCell(iconImage: "1-6", tuning: "Уведомления")
    var cellTable7 = ThirdCell(iconImage: "1-7", tuning: "Звуки, тактильные сигналы")
    var cellTable8 = ThirdCell(iconImage: "1-8", tuning: "Не беспокоить")
    var cellTable9 = ThirdCell(iconImage: "1-9", tuning: "Экранное время")
    var cellTable10 = ThirdCell(iconImage: "1-10", tuning: "Основаные")
    var cellTable11 = ThirdCell(iconImage: "1-11", tuning: "Пункт управления")
    var cellTable12 = ThirdCell(iconImage: "1-12", tuning: "Экран и яркость")
    
    static func contents() -> [Content]{
        return [
            Content(number: "", names: ["cellTable1","cellTable2","cellTable3","cellTable4","cellTable5"]),
            Content(number: "", names: ["cellTable6","cellTable7","cellTable8","cellTable9"]),
            Content(number: "", names: ["cellTable10","cellTable11","cellTable12","cellTable3","cellTable4"])
        ]
    }
}
class TableViewController: UIViewController {
    var cont = ContentTable.contents()
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cont.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cont[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell") as! FirstTableViewCell
        cell.firstCell = cont[indexPath.row]
        
        return cell
    }
}
