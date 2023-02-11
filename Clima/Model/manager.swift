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
            //there we have used the closures
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil
                {
                    print(error!)
                    return
                }
                
                 if let safeData = data
                {
                     
                     self.parseJson(weather: safeData)
                    
                 }
            })
            
            //Start the task
            task.resume()
    
            
        }
    }
     
    func parseJson(weather : Data)
    {
        let decoder = JSONDecoder()
        do{
            let decoded_data = try decoder.decode(WeatherData.self, from: weather )
            let id = decoded_data.weather[0].id
            let temp = decoded_data.main.temp
            let name = decoded_data.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
            
            print(weather.temperature)
        } catch{
            print(error)
        }
    }
   
        
    }

