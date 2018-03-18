//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherPresenter: WeatherViewOutput, WeatherInteractorOutput, ModuleInput {
    
    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterProtocol!
    
    //MARK: - module input
    
    func setData(_ data: Any?) {
        guard let place = data as? Place else { return }
        interactor.setCoordinates(Coordinates(longitude: place.longitude, latitude: place.latitude))
        interactor.setPlaceID(place.placeID)
    }
    
    // MARK: - view output
    
    func viewIsReady() {
        interactor.getWeatherFromCoordinates()
        interactor.loadPhotoForPlace()
    }
    
    func setCollectionContainerModuleInput(_ moduleInput: ModuleInput) {
        router.setCollectionContainerModuleInput(moduleInput)
    }
    
    // MARK: - interactor output
    
    func getWeatherSuccess(with weatherInfo: WeatherInfo) {
        guard let state = weatherInfo.weather.first?.description else { return }
        let temperature = "\(Int(weatherInfo.main.temp))°C"
        let sunriseDate = Date(timeIntervalSince1970: TimeInterval(weatherInfo.sys.sunrise))
        let sunsetDate = Date(timeIntervalSince1970: TimeInterval(weatherInfo.sys.sunset))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let sunriseTime = dateFormatter.string(from: sunriseDate)
        let sunsetTime = dateFormatter.string(from: sunsetDate)
        
        view.setState(state)
        view.setTemperature(temperature)
        view.setSunriseTime(sunriseTime)
        view.setSunsetTime(sunsetTime)
        view.setCityTitle(weatherInfo.name)
        
        router.sendWeatherInfoToCollectionContainer(weatherInfo)
    }
    
    func getWeatherFailure(with message: String) {
        router.showErrorAlert(with: message)
    }
    
    func didFinishLoadImage(with response: Response<PhotoModel>) {
        switch response {
            case .success(let photoModel): view.setCityImage(photoModel.photo)
            case .error(let errorMessage): router.showErrorAlert(with: errorMessage)
        }
    }
    
}
