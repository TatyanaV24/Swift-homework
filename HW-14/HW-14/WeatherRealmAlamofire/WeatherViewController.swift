//
//  WeatherViewController.swift
//  HW-14
// новый ключ - 1ea27c2b0c2be9647eea572e1eb3c765
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit
import Alamofire

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
        
        parsingOneDay()
        parsingSeveralDay()
    }
    
    func parsingOneDay(){
        
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
                    let database = WRManager.sharedInstance.getDataFromDBOneDay()
                    if database.isEmpty {                                          // если бд пустая
                        WRManager.sharedInstance.addDataOneDay(object: self.objw) // записываем данные в бд
                    } else{
                        for base in database {                                    // выводим данные из бд
                            self.cityLabel.text = base.cityName
                            self.tempLabel.text = base.temperature.description + "ºC"
                            self.feelsLabel.text = base.feelsLike.description + "ºC"
                            self.pressLabel.text = base.pressureDay.description + " мм.рт.ст"
                            self.humLabel.text = base.humidityDay.description + "%"
                        }
                        WRManager.sharedInstance.updateAddOneDay(object: self.objw) // обновляем и перезаписываем данные в бд
                    }
                }
            }
        }
    }
    func parsingSeveralDay(){// парсинг прогноза на несколько дней
            AF.request ("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: ListW.self) { response in
                print(response)
    
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
                                let newObject = ObjectWeatherSeveralDay()
                                newObject.day = data.dt
                                newObject.averTemp = Int(data.main.temp)
                                newObject.maxTemp = Int(data.main.temp_max)
                                newObject.minTemp = Int(data.main.temp_min)
                                self.severalDay.append(newObject)
                                self.resultWeather.weather.append(newObject)
                                self.alamTableView.reloadData()
                            }
                        }
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
        return severalDay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
        let database = WRManager.sharedInstance.getDataFromDB()
        
        let localDateFormat = DateFormatter()
        localDateFormat.dateFormat = "dd.MM"
        
        if database.isEmpty {
            
            WRManager.sharedInstance.addData(object: self.severalDay)
        } else {
            for base in database {
           let date = Date(timeIntervalSince1970: TimeInterval(base.weather.first!.day))
                cell.dateLabel.text = localDateFormat.string(from: date)
                cell.averTempLabel.text = (base.weather.first?.averTemp.description)! + "ºC"
                cell.minTempLabel.text = (base.weather.first?.minTemp.description)! + "ºC"
                cell.maxTempLabel.text = (base.weather.first?.maxTemp.description)! + "ºC"
            }
            WRManager.sharedInstance.updateAddData(object: self.severalDay)
        }
        return cell
    }
}
