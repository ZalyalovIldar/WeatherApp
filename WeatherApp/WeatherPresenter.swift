//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit
class WeatherPresenter: WeatherPresenterProtocol {
    var cellViewModels = [WeatherCellViewModel]()
    func apiBegin(with collectionView: UICollectionView, and city: String, and state: String) {
        let weatherApi = WeatherAPIClient()
        let weatherEndPoint = WeatherEndPoint.forecast(city: city, state: state)
        weatherApi.weather(with: weatherEndPoint) { (either) in
            switch either {
            case .value(let forecastText):
                self.cellViewModels = forecastText.forecastDays.map {
                    WeatherCellViewModel(url: $0.iconUrl, description: $0.description, descriptionName: $0.descriptionName)
                }
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
            case .error( let error):
                print(error)
            }
        }
    }
}
