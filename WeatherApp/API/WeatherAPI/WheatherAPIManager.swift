//
//  WheatherAPIManager.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

class WheatherAPIManager: WheatherAPIManagerProtocol {
    
    let weatherApiKey = "b129c611e95baaed53f046f4f176e79b"
    let apiKey = "AIzaSyB7wVzDogPVVLQcNAv6anTKhJ0OlPkwA1s"
    let bundleId = "com.blvvvck.MapKitTutorial"
    let searchEngineId = "000567601044423426073:csncyzipwb4"
    let imageView = UIImageView()
    
    func getFirstImage(with query: String, completionBlock: @escaping (UIImage) -> ()) {
        
        let serverAddress = String(format: "https://www.googleapis.com/customsearch/v1?q=%@&cx=%@&key=%@",query ,searchEngineId, apiKey)
        
        let url = serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalUrl = URL(string: url!)
        let request = NSMutableURLRequest(url: finalUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.setValue(bundleId, forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
                    print("asyncResult\(jsonResult)")
                }
                
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
            
            do {
                let modelDictionary = try JSONDecoder().decode(ImageWeather.self, from: data!)
                guard let imageString = modelDictionary.items.first?.pagemap?.cse_thumbnail?.first?.src else { return }
                print("КАРТИНКА \(imageString)")
                
                guard let url = URL(string: imageString) else { return }
                let data = try? Data(contentsOf: url)
                let image = UIImage(data: data!)
                
                guard let imageCheck = image else { return }
                completionBlock(imageCheck)
                
            } catch let errorMessage {
                print(errorMessage.localizedDescription)
            }
        }
        datatask.resume()
    }
    
    func getWheaterInfo(with place: Coordinates, completionBlock: @escaping (WeatherInfo) -> ()) {
        
        guard let url = URL(string: "https://api.darksky.net/forecast/\(weatherApiKey))/\(place.latitude),\(place.longitude)") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print("Error: \(String(describing: error?.localizedDescription))")
                
            } else {
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch let errorMessage2 {
                    print(errorMessage2.localizedDescription)
                }
                
                do {
                    let modelDictionary = try JSONDecoder().decode(WeatherInfo.self, from: data)
                   completionBlock(modelDictionary)
                    
                } catch let errorMessage {
                    print(errorMessage.localizedDescription)
                }
            }
            }.resume()
    }
}
