//
//  WeatherViewController.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit
import Alamofire
import RealmSwift

class ObjectWeather: Object {
    
    @objc dynamic var cityName = ""
    @objc dynamic var temperature = 0
    @objc dynamic var feelsLike = 0
    @objc dynamic var pressureDay = 0
    @objc dynamic var humidityDay = 0
    @objc dynamic var id = 2
    
    override static func primaryKey() -> String? {
            return "id"
        }
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    @IBOutlet weak var alamTableView: UITableView!
    
    var weatherDate = WeatherData()
    let objw = ObjectWeather()
//    var list = ListW()
//    var mode:[FeatherData] = []
    private let uirealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsing()
        
//        alamTableView.delegate = self
//        alamTableView.dataSource = self
        
//        AF.request ("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: ListW.self) { response in
//            print(response)
//
//            if let result = response.value {
//                let json = result
//                print(json)
//                DispatchQueue.main.async {
//                    var uniqueDates: [String] = []
//                    let dateFormat = DateFormatter()
//                    dateFormat.dateFormat = "MM/dd/yyyy"
//                    json.list.forEach { (data) in
//                        let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(data.dt)))
//
//                        if !uniqueDates.contains(formattedDate) {
//                            uniqueDates.append(formattedDate)
//                            self.mode.append(data)
//                        }
//                        self.alamTableView.reloadData()
//                    }
//                }
//            }
//        }
    }
    
    func updateView() {
        cityLabel.text = objw.cityName
        tempLabel.text = objw.temperature.description + "ºC"
        feelsLabel.text = objw.feelsLike.description + "ºC"
        pressLabel.text = objw.pressureDay.description + " мм.рт.ст"
        humLabel.text = objw.humidityDay.description + "%"
    }
    
    func parsing(){
        
        AF.request ("http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: WeatherData.self) { response in
            print(response)
            
            if let result = response.value {
                self.weatherDate = result
                self.objw.cityName = self.weatherDate.name
                self.objw.temperature = Int(self.weatherDate.main.temp)
                self.objw.feelsLike = Int(self.weatherDate.main.feels_like)
                self.objw.pressureDay = self.weatherDate.main.pressure
                self.objw.humidityDay = self.weatherDate.main.humidity
                let obar = self.uirealm.object(ofType: ObjectWeather.self, forPrimaryKey: 2)
                
                DispatchQueue.main.async {
                    if obar != obar {
                        try! self.uirealm.write{
                            self.uirealm.add(self.objw)
                        }
                    } else {
                        self.updateView()
                    }
                }
            }
        }
    }
}

//extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 126
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mode.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
//        let opt = mode[indexPath.row]
//        let date = Date(timeIntervalSince1970: TimeInterval(opt.dt))
//        let localDateFormat = DateFormatter()
//        localDateFormat.dateFormat = "dd.MM"
//        cell.dateLabel.text = localDateFormat.string(from: date)
//        cell.averTempLabel.text = opt.main.temp.description + "ºC"
//        cell.minTempLabel.text = opt.main.temp_min.description + "ºC"
//        cell.maxTempLabel.text = opt.main.temp_max.description + "ºC"
//        return cell
//    }
//}

