//
//  Constants.swift
//  AlgonaWeather
//
//  Created by harikanth on 1/5/17.
//  Copyright © 2017 Code Bramha. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat=\(Location.sharedInstance.latitude!)"
let LONGITUDE = "&lon=\(Location.sharedInstance.longitude!)"
let APP_ID = "&appid="
let API_KEY = "9e11867a317c5c3afa3410e9aa249945"

typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"


let BASE_URL1 = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let CNT = "&cnt="
let MODE = "&mode=json"

let FORECAST_WEATHER_URL = "\(BASE_URL1)\(LATITUDE)\(LONGITUDE)\(CNT)10\(MODE)\(APP_ID)\(API_KEY)"
