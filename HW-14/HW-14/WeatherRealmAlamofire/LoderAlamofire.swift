//
//  LoderAlamofire.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 07.04.2021.
//

import Foundation
import Alamofire

class LoderAlamofire{
    class func parsingOneDay(completion: @escaping (WeatherData) -> Void) {
        // парсинг прогноза на один день
        AF.request ("http://api.openweathermap.org/data/2.5/weather?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: WeatherData.self) { response in
            //            print(response)
            
            if let result = response.value {
                let object = result
                print("мои \(object)")
            }
        }
    }
    
    class func parsingSeveralDay(completion: @escaping (ListW) -> Void) {
        AF.request ("http://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=ea5e2d3c2f5e9ec322593ff4b368cafc").responseDecodable(of: ListW.self) { response in
            print(response)
            
            if let result = response.value {
                let json = result
                print("tot \(json)")
//                DispatchQueue.main.async {
//                    var uniqueDates: [String] = []
//                    var mode:[FeatherData] = []
//                    let dateFormat = DateFormatter()
//                    dateFormat.dateFormat = "MM/dd/yyyy"
//                    json.list.forEach { (data) in
//                        let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(data.dt)))
//                        
//                        if !uniqueDates.contains(formattedDate) {
//                            uniqueDates.append(formattedDate)
//                            mode.append(data)
//                        }
//                    }
//                }
            }
        }
    }
}
