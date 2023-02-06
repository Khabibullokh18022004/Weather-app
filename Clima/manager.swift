//
//  manager.swift
//  Clima
//
//  Created by Habibulloh on 31/01/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=tashkent&appid=11740bc96dd38362ff1f604637963b70&units=metric"
    
    
    func fetchWeather (city_name: String){
        
    let urlString = "\(weatherURL)&q=\(city_name)"
performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //Create a URL
        
        if let url = URL(string : urlString ){
            //Create a URL session
            let session = URLSession(configuration: .default)
            
            //Give the session task
         let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //Start the task
            task.resume()
            
        }
    }
    func handle(data : Data?, response : URLResponse?, error : Error?)
    {
        if error != nil
        {
            print(error!)
            return
        }
        
         if let safeData = data
        {
             
             let dataString = String(data: safeData, encoding: .utf8)
             print(dataString!)
         }
    }
    
    
}
