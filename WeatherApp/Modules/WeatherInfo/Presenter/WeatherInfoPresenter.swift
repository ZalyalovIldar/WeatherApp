//
//  WeatherInfoPresenter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInfoPresenter: WeatherInfoOutput, WeatherInfoInteractorOutput, ModuleInput {
    
    weak var view: WeatherInfoInput!
    var interactor: WeatherInfoInteractorInput!
    var router: WeatherInfoRouterProtocol!
    
    // MARK: - Module Input
    
    func setData(_ data: Any?) {
        guard let weatherInfo = data as? WeatherInfo else { return }
        interactor.convertAndSetColletionInfo(from: weatherInfo)
        view.refreshCollectionView()
    }
    
    // MARK: - View Output
    
    func viewIsReady() {
        view.prepareCollectionView()
    }
    
    func updateCurrentWeatherInfo(at indexPath: IndexPath) {
        interactor.updateCurrentInfo(at: indexPath)
    }
    
    func updateCurrentWeatherInfoCount() {
        interactor.updateCurrentInfoCount()
    }
    
    // MARK: - Interactor Output
    
    func didFinishUpdateCurrentWeatherInfo(_ weatherInfo: WeatherCollectionInfo) {
        view.set(currentWeatherInfoTitle: weatherInfo.title)
        view.set(currentWeatherInfoText: weatherInfo.text)
    }
    
    func dudFinishUpdateCurrentWeatherInfoCount(_ count: Int) {
        view.set(currentWeatherInfoCount: count)
    }
    
}
