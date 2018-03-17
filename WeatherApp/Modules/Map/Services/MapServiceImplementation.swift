//
//  MapServiceImplementation.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapServiceImplementation: MapService {
    
    var apiProvider: ApiProvider!
    
    let dataErrorMessage = "Ошибка при получении данных"
    let coatOfArmsUrlKey = "contentUrl"
    
    func getCoatOfArms(with request: Request, completionBlock: @escaping (Response<MapInfo>) -> Void) {
        apiProvider.makeRequest(with: request) { [weak self] (data) in
            guard let strongSelf = self else { return }
            guard let data = data else {
                completionBlock(.error(strongSelf.dataErrorMessage))
                return
            }
            
            guard let mapInfo = try? JSONDecoder().decode(MapInfo.self, from: data) else {
                completionBlock(.error(strongSelf.dataErrorMessage))
                return
            }
            
            completionBlock(.success(mapInfo))
        }
    }
    
}
