//
//  WeatherViewController.swift
//  HW-14
//
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
    var list = ListW()
    var mode:[FeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamTableView.delegate = self
        alamTableView.dataSource = self
        
        AF.request ("http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: WeatherData.self) { response in
            print(response)
            
            if let result = response.value {
                let JSON = result
                print(JSON)
                self.weatherDate = JSON
                DispatchQueue.main.async {
                    self.updateView()
                }
            }
        }
        
        AF.request ("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: ListW.self) { response in
            print(response)
            
            if let result = response.value {
                let json = result
                print(json)
                DispatchQueue.main.async {
                    var uniqueDates: [String] = []
                    let dateFormat = DateFormatter()
                    dateFormat.dateFormat = "MM/dd/yyyy"
                    json.list.forEach { (data) in
                        let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(data.dt)))
                        
                        if !uniqueDates.contains(formattedDate) {
                            uniqueDates.append(formattedDate)
                            self.mode.append(data)
                        }
                        self.alamTableView.reloadData()
                    }
                }
            }
        }
    }
    
    func updateView() {
        cityLabel.text = weatherDate.name
        tempLabel.text = weatherDate.main.temp.description + "ºC"
        feelsLabel.text = weatherDate.main.feels_like.description + "ºC"
        pressLabel.text = weatherDate.main.pressure.description + " мм.рт.ст"
        humLabel.text = weatherDate.main.humidity.description + "%"
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
        let opt = mode[indexPath.row]
        let date = Date(timeIntervalSince1970: TimeInterval(opt.dt))
        let localDateFormat = DateFormatter()
        localDateFormat.dateFormat = "dd.MM"
        cell.dateLabel.text = localDateFormat.string(from: date)
        cell.averTempLabel.text = opt.main.temp.description + "ºC"
        cell.minTempLabel.text = opt.main.temp_min.description + "ºC"
        cell.maxTempLabel.text = opt.main.temp_max.description + "ºC"
        return cell
    }
}

