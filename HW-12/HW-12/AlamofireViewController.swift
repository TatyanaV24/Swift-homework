//
//  AlamofireViewController.swift
//  HW-12
//
//  Created by Татьяна Васильченко on 16.03.2021.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {
    
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
                self.list = json
                self.mode = json.list
                DispatchQueue.main.async {
                    self.alamTableView.reloadData()
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

extension AlamofireViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        //        localDateFormat.dateFormat = "HH:mm:ss"
        //        let dt_time = localDateFormat.string(from: date)
        //        print(dt_time)

        //        if(dt_time == "15:00:00"){
        localDateFormat.dateFormat = "dd.MM"
        cell.dateLabel.text = localDateFormat.string(from: date)
        cell.averTempLabel.text = opt.main.temp.description + "ºC"
        cell.minTempLabel.text = opt.main.temp_min.description + "ºC"
        cell.maxTempLabel.text = opt.main.temp_max.description + "ºC"
        return cell
    }
}
