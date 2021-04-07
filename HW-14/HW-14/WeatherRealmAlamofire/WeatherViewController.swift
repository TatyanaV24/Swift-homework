//
//  WeatherViewController.swift
//  HW-14
// новый ключ - 1ea27c2b0c2be9647eea572e1eb3c765
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    @IBOutlet weak var alamTableView: UITableView!
    
    var weatherDate = WeatherData()
    let objw = ObjectWeatherDay()
    
    var mode:[FeatherData] = []
    var severalDay:[ObjectWeatherSeveralDay] = []
    var resultWeather = ObjectWS()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamTableView.delegate = self
        alamTableView.dataSource = self
        let database = WRManager.sharedInstance.getDataFromDBOneDay()
        if database.isEmpty {                                          // если бд пустая
            updateOneDay()                                             // записываем данные в бд
        } else{
            for sender in database {                                    // выводим данные из бд
                self.cityLabel.text = sender.cityName
                self.tempLabel.text = sender.temperature.description + "ºC"
                self.feelsLabel.text = sender.feelsLike.description + "ºC"
                self.pressLabel.text = sender.pressureDay.description + " мм.рт.ст"
                self.humLabel.text = sender.humidityDay.description + "%"
            }
            updateOneDay()  // обновляем и перезаписываем данные в бд
        }
    }
    
    func updateOneDay(){
        LoderAlamofire.parsingOneDay { object in
            DispatchQueue.main.async {
                self.weatherDate = object
                self.objw.cityName = self.weatherDate.name
                self.objw.temperature = Int(self.weatherDate.main.temp)
                self.objw.feelsLike = Int(self.weatherDate.main.feels_like)
                self.objw.pressureDay = self.weatherDate.main.pressure
                self.objw.humidityDay = self.weatherDate.main.humidity
                print(self.objw)
                
                WRManager.sharedInstance.addDataOneDay(object: self.objw)
            }
        }
    }
    
    func updateSeveralDay(){
        LoderAlamofire.parsingSeveralDay { json in
            DispatchQueue.main.async {
                var uniqueDates: [String] = []
                var mode:[FeatherData] = []
                let dateFormat = DateFormatter()
                dateFormat.dateFormat = "MM/dd/yyyy"
                json.list.forEach { (data) in
                    let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(data.dt)))
                    
                    if !uniqueDates.contains(formattedDate) {
                        uniqueDates.append(formattedDate)
                        mode.append(data)
                        
                        let newObject = ObjectWeatherSeveralDay()
                        newObject.day = data.dt
                        newObject.averTemp = Int(data.main.temp)
                        newObject.maxTemp = Int(data.main.temp_max)
                        newObject.minTemp = Int(data.main.temp_min)
                        self.severalDay.append(newObject)
                        self.resultWeather.weather.append(newObject)
                        
                        WRManager.sharedInstance.addData(object: self.resultWeather)
                    }
                    self.alamTableView.reloadData()
                }
            }
        }
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WRManager.sharedInstance.getDataFromDB().count //severalDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
        let database = WRManager.sharedInstance.getDataFromDB()
        
        let localDateFormat = DateFormatter()
        localDateFormat.dateFormat = "dd.MM"
        
        if database.isEmpty {
            updateSeveralDay()
            
        } else {
            for base in database {
                let date = Date(timeIntervalSince1970: TimeInterval(base.weather.first!.day))
                cell.dateLabel.text = localDateFormat.string(from: date)
                cell.averTempLabel.text = (base.weather.first?.averTemp.description)! + "ºC"
                cell.minTempLabel.text = (base.weather.first?.minTemp.description)! + "ºC"
                cell.maxTempLabel.text = (base.weather.first?.maxTemp.description)! + "ºC"
            }
            updateSeveralDay()
            
        }
        return cell
    }
}
