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
    
    //    var mode:[FeatherData] = []
    var severalDay:[ObjectWeatherSeveralDay] = []
    //    var resultWeather = ObjectWS()
    
    let databaseSeveral = WRManager.sharedInstance.getDataFromDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamTableView.delegate = self
        alamTableView.dataSource = self
        
        updateSeveralDay()
        
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
            self.weatherDate = object
            self.objw.cityName = self.weatherDate.name
            self.objw.temperature = Int(self.weatherDate.main.temp)
            self.objw.feelsLike = Int(self.weatherDate.main.feels_like)
            self.objw.pressureDay = self.weatherDate.main.pressure
            self.objw.humidityDay = self.weatherDate.main.humidity
//            print(self.objw)
            
            WRManager.sharedInstance.addDataOneDay(object: self.objw)
        }
    }
    
    func updateSeveralDay(){
        if databaseSeveral.isEmpty {
            LoderAlamofire.parsingSeveralDay { json in
                var ti = json.list
                WRManager.sharedInstance.addDataArray(data: json.list) // при получении данных сохраняю в реалм
            }
        }else {
            print("вот \(severalDay)")
                }
//                    print("вот \(severalDay)")
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
        let opt = databaseSeveral[indexPath.row].weather.first! as ObjectWeatherSeveralDay
        
        let localDateFormat = DateFormatter()
        localDateFormat.dateFormat = "dd.MM"
        
        let date = Date(timeIntervalSince1970: TimeInterval(opt.day))
        cell.dateLabel.text = localDateFormat.string(from: date)
        cell.averTempLabel.text = (opt.averTemp.description) + "ºC"
        cell.minTempLabel.text = (opt.minTemp.description) + "ºC"
        cell.maxTempLabel.text = (opt.maxTemp.description) + "ºC"
        return cell
    }
}
