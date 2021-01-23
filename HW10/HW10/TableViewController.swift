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

class TableViewController: UIViewController {
    
    let settingSections = [
        SettingSection(
            title: " ",
            settings: [Setting(title: "Авиарежим", icon: UIImage(named: "1-1"), isSwitchHidden: false),
                       Setting(title: "WI-FI", icon: UIImage(named: "1-2"), isSwitchHidden: true),
                       Setting(title: "Bluetooth", icon: UIImage(named: "1-3"), isSwitchHidden: true),
                       Setting(title: "Сотовая связь", icon: UIImage(named: "1-4"), isSwitchHidden: true),
                       Setting(title: "Режим модема", icon: UIImage(named: "1-5"), isSwitchHidden: true)]),
        SettingSection(
            title: " ",
            settings: [Setting(title: "Уведомления", icon: UIImage(named: "1-6"), isSwitchHidden: true),
                       Setting(title: "Звуки, тактильные сигналы", icon: UIImage(named: "1-7"), isSwitchHidden: true),
                       Setting(title: "Не беспокоить", icon: UIImage(named: "1-8"), isSwitchHidden: true),
                       Setting(title: "Экранное время", icon: UIImage(named: "1-9"), isSwitchHidden: true)]),
        SettingSection(
            title: " ",
            settings: [Setting(title: "Основаные", icon: UIImage(named: "1-10"), isSwitchHidden: true),
                       Setting(title: "Пункт управления", icon: UIImage(named: "1-11"), isSwitchHidden: true),
                       Setting(title: "Экран и яркость", icon: UIImage(named: "1-12"), isSwitchHidden: true)])]

}
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingSections[section].settings.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingSections[section].title
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell",for: indexPath) as! SetTableViewCell
        let name = settingSections[indexPath.section].settings[indexPath.row]
        cell.nameLabel.text = name.title
        cell.iconImage.image = name.icon
        cell.switchButton.isHidden = name.isSwitchHidden
        if indexPath.section == 0, indexPath.row == 0 {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
}
