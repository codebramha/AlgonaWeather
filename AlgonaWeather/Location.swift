//
//  Location.swift
//  AlgonaWeather
//
//  Created by harikanth on 1/9/17.
//  Copyright © 2017 Code Bramha. All rights reserved.
//

import CoreLocation
class Location{
    static var sharedInstance = Location()
    private init(){}
    var latitude: Double!
    var longitude: Double!
    
}
