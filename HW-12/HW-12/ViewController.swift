//
//  ViewController.swift
//  HW-12
//"api.openweathermap.org/data/2.5/onecall?lat=55.75&lon=37.61&exclude=daily&appid=ea5e2d3c2f5e9ec322593ff4b368cafc"
//  Created by Татьяна Васильченко on 10.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    
    var weatherDate = WeatherData()
    var list = ListW()
    var mode:[FeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherTableView.reloadData()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            do {
                let cityWeather = try JSONDecoder().decode(WeatherData.self, from: data)
                print(cityWeather)
                self.weatherDate = cityWeather
                DispatchQueue.main.async {
                    
                    self.updateView()
                }
            } catch let error{
                print(error)
            }
        }
        .resume()
        
        let url2 = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc")!
        URLSession.shared.dataTask(with: url2) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            do {
                let json = try JSONDecoder().decode(ListW.self, from: data)
                print(json)
                self.list = json
                self.mode = json.list
                DispatchQueue.main.async {
                    var mode:[FeatherData] = []
                    for v in json.list {
                        mode.append(v)
                    }
                    self.weatherTableView.reloadData()
                }
            } catch let error{
                print(error)
            }
        }.resume()
        
    }
    
    func updateView() {
        cityNameLabel.text = weatherDate.name
        temperatureLabel.text = weatherDate.main.temp.description + "ºC"
        feelsLikeLabel.text = weatherDate.main.feels_like.description + "ºC"
        pressureLabel.text = weatherDate.main.pressure.description + " мм.рт.ст"
        humidityLabel.text = weatherDate.main.humidity.description + "%"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherViewCell", for: indexPath) as! WeatherViewCell
        let opt = mode[indexPath.row]
        cell.averageTempLabel.text = opt.main.temp.description + "ºC"
        cell.minTempLabel.text = list.list[indexPath.row].main.temp_min.description + "ºC"
        cell.maxTempLabel.text = list.list[indexPath.row].main.temp_max.description + "ºC"
        return cell
    }
}
