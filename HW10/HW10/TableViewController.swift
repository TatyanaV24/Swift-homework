//
//  TableViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 17.12.2020.
//

import UIKit

struct Setting {
    let title: String
    let icon: UIImage?
    let isSwitchHidden: Bool
    
    init(title: String, icon: UIImage?, isSwitchHidden: Bool = true){
        self.title = title
        self.icon = icon
        self.isSwitchHidden = isSwitchHidden
    }
}
struct SettingSection {
    let title: String
    let settings: [Setting]
}
class SettingsViewController: UIViewController {
    let settingSections = [
        SettingSection(
            title: "1",
            settings: [Setting(title: "Авиарежим", icon: UIImage(named: "1-1"), isSwitchHidden: true),
                       Setting(title: "WI-FI", icon: UIImage(named: "1-2"), isSwitchHidden: false),
                       Setting(title: "Bluetooth", icon: UIImage(named: "1-3"), isSwitchHidden: false),
                       Setting(title: "Сотовая связь", icon: UIImage(named: "1-4"), isSwitchHidden: false),
                       Setting(title: "Режим модема", icon: UIImage(named: "1-5"), isSwitchHidden: false)]),
        SettingSection(
            title: "2",
            settings: [Setting(title: "Уведомления", icon: UIImage(named: "1-7"), isSwitchHidden: false),
                       Setting(title: "Звуки, тактильные сигналы", icon: UIImage(named: "1-1"), isSwitchHidden: false),
                       Setting(title: "Не беспокоить", icon: UIImage(named: "1-8"), isSwitchHidden: false),
                       Setting(title: "Экранное время", icon: UIImage(named: "1-9"), isSwitchHidden: false)]),
        SettingSection(
            title: "3",
            settings: [Setting(title: "Основаные", icon: UIImage(named: "1-10"), isSwitchHidden: false),
                       Setting(title: "Пункт управления", icon: UIImage(named: "1-11"), isSwitchHidden: false),
                       Setting(title: "Экран и яркость", icon: UIImage(named: "1-12"), isSwitchHidden: false)])]
}

class TableViewController: UIViewController {
    
    var cont: SettingsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cont.settingSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cont.settingSections[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! SetTableViewCell
        cell.nameLabel.text = cont.settingSections[indexPath.row].title
        return cell
    }
}
