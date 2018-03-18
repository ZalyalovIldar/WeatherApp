//
//  GoogleQueryApiManagerImplementation.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 19.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class GoogleQueryApiManagerImplementation: GoogleQueryApiManager {
    
    let apiKey = "AIzaSyB7wVzDogPVVLQcNAv6anTKhJ0OlPkwA1s"
    let bundleId = "com.blvvvck.MapKitTutorial"
    let searchEngineId = "000567601044423426073:csncyzipwb4"
    
    func getFirstImage(with query: String, completionBlock: @escaping (UIImage) -> ()) {
        
        let serverAddress = String(format: "https://www.googleapis.com/customsearch/v1?q=%@&cx=%@&key=%@",query ,searchEngineId, apiKey)
        
        let url = serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalUrl = URL(string: url!)
        let request = NSMutableURLRequest(url: finalUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.setValue(bundleId, forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            //            do{
            //                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
            //                    print("asyncResult\(jsonResult)")
            //                }
            //
            //            }
            //            catch let error as NSError{
            //                print(error.localizedDescription)
            //            }
            
            do {
                let modelDictionary = try JSONDecoder().decode(Image.self, from: data!)
                guard let imageString = modelDictionary.items.first?.pagemap?.cse_thumbnail?.first?.src else { return }
                //print("КАРТИНКА \(imageString)")
                SDWebImageManager.shared().imageDownloader?.downloadImage(with: URL(string: imageString), options: .continueInBackground, progress: { (_,_ ,_ ) in
                    
                }, completed: { (image, _, _, _) in
                    completionBlock(image!)
                })
                
            } catch let errorMessage {
                print(errorMessage.localizedDescription)
            }
        }
        datatask.resume()
    }
}
