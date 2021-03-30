//
//  WeatherViewController.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit
import Alamofire
import RealmSwift

class ObjectWeatherDay: Object {
    
    @objc dynamic var cityName = ""
    @objc dynamic var temperature = 0
    @objc dynamic var feelsLike = 0
    @objc dynamic var pressureDay = 0
    @objc dynamic var humidityDay = 0
}

class ObjectWeatherSeveralDay: Object {
    @objc dynamic var day = 0
    @objc dynamic var averTemp = 0
    @objc dynamic var minTemp = 0
    @objc dynamic var maxTemp = 0
}

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    @IBOutlet weak var alamTableView: UITableView!
    
    var weatherDate = WeatherData()
    let objw = ObjectWeatherDay()
//    var list = ListW()
    var mode:[FeatherData] = []
    var severalDay:[ObjectWeatherSeveralDay] = []
    
    private let uirealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamTableView.delegate = self
        alamTableView.dataSource = self
        
        parsing()
        dataForTable()
    }
    
    func updateView() {
        cityLabel.text = objw.cityName
        tempLabel.text = objw.temperature.description + "ºC"
        feelsLabel.text = objw.feelsLike.description + "ºC"
        pressLabel.text = objw.pressureDay.description + " мм.рт.ст"
        humLabel.text = objw.humidityDay.description + "%"
        
        
    }
    
    func parsing(){
        
        // парсинг прогноза на один день
        AF.request ("http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: WeatherData.self) { response in
            print(response)
            
            if let result = response.value {
                self.weatherDate = result
                self.objw.cityName = self.weatherDate.name
                self.objw.temperature = Int(self.weatherDate.main.temp)
                self.objw.feelsLike = Int(self.weatherDate.main.feels_like)
                self.objw.pressureDay = self.weatherDate.main.pressure
                self.objw.humidityDay = self.weatherDate.main.humidity
                
                DispatchQueue.main.async {
                    if self.objw != self.objw {
                        try! self.uirealm.write{
                            self.uirealm.add(self.objw)
                        }
                    } else {
                        self.updateView()
                    }
                }
            }
        }
        
        AF.request ("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: ListW.self) { response in
//            print(response)
            
            if let result = response.value {
                let json = result
                DispatchQueue.main.async {
                    var uniqueDates: [String] = []
                    let dateFormat = DateFormatter()
                    dateFormat.dateFormat = "MM/dd/yyyy"
                    json.list.forEach { (data) in
                        let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(data.dt)))
                        
                        if !uniqueDates.contains(formattedDate) {
                            uniqueDates.append(formattedDate)
                            self.mode.append(data)
                           
                             
                            for index in 0 ..< self.severalDay.count{
                                self.severalDay[index].day = self.mode[index].dt
                                self.severalDay[index].averTemp = Int(self.mode[index].main.temp)
                                self.severalDay[index].maxTemp = Int(self.mode[index].main.temp_max)
                                self.severalDay[index].minTemp = Int(self.mode[index].main.temp_min)
                                print(self.severalDay[index].day)
                            }
                        }
                        
                    }
                }
            }
        }
    }
 
    func dataForTable() {
//        for (index, _) in severalDay.enumerated(){
//            severalDay[index].day = mode[index].dt
//            severalDay[index].averTemp = Int(mode[index].main.temp)
//            severalDay[index].maxTemp = Int(mode[index].main.temp_max)
//            severalDay[index].minTemp = Int(mode[index].main.temp_min)
//        }
        if severalDay.isEmpty {
            try! uirealm.write {
                uirealm.add(severalDay)
            }
        } else {
            uirealm.objects(ObjectWeatherSeveralDay.self)
        }
        self.alamTableView.reloadData()
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return severalDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
        let opt = severalDay[indexPath.row]
        let date = Date(timeIntervalSince1970: TimeInterval(opt.day))
        let localDateFormat = DateFormatter()
        localDateFormat.dateFormat = "dd.MM"
        cell.dateLabel.text = localDateFormat.string(from: date)
        cell.averTempLabel.text = opt.averTemp.description + "ºC"
        cell.minTempLabel.text = opt.minTemp.description + "ºC"
        cell.maxTempLabel.text = opt.maxTemp.description + "ºC"
        return cell
    }
}
