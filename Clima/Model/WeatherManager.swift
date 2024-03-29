//
//  WeatherManager.swift
//  Clima
//
//  Created by Andrickson Coste on 2/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=31e84025280387d00cd4d8644ad2e716&units=imperial"
    
    func fetcWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        //1. Create a URL (Optional Binding)
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    //Exit out of this function and don't continue
                    return
                }
                if let safeData = data{
                    //Convert data to a String
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
}

