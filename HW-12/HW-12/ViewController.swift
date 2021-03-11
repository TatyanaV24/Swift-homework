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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            do {
                let cityWeather = try JSONDecoder().decode(WeatherData.self, from: data)
                print(cityWeather)
                
            } catch let error{
                print(error)
            }
        }.resume()
        
    }
    
    func updateView() {
        cityNameLabel.text = weatherDate.name
        temperatureLabel.text = weatherDate.main.temp.description + "ºC"
        feelsLikeLabel.text = weatherDate.main.feels_like.description + "ºC"
        pressureLabel.text = weatherDate.main.pressure.description
        humidityLabel.text = weatherDate.main.humidity.description
        
    }

}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherViewCell") as! WeatherViewCell
//        let model = list[indexPath.row]
//        cell.minTempLabel.text = weatherDate.main.tempMin.description + "ºC"
//
//        return cell
//    }
//
//}
