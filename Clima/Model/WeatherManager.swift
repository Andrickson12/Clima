//
//  WeatherManager.swift
//  Clima
//
//  Created by Andrickson Coste on 2/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=31e84025280387d00cd4d8644ad2e716&units=imperial"
    
    func fetcWeather(cityName: String) {
        let urlString = ("\(weatherURL)&q=\(cityName)")
        print(urlString)
        
    }

}

