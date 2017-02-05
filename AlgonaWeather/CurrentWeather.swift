//
//  CurrentWeather.swift
//  AlgonaWeather
//
//  Created by harikanth on 1/5/17.
//  Copyright © 2017 Code Bramha. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _humidity: Double!
    
    var cityName: String {
        
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String{
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = currentDate
        return _date
        
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var humidity: Double{
        if _humidity == nil{
            _humidity = 0.0
        }
        return _humidity
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    
                    if let currentTemparature = main["temp"] as? Double {
                        let kelvinToFarenheitPreDiv = (currentTemparature * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv / 10))
                        self._currentTemp = kelvinToFarenheit
                    }
                    if let humidity = main["humidity"] as? Double {
                        self._humidity = humidity
                    }
                }
                
            }
            completed()
        }
        
        
    }
    
}
