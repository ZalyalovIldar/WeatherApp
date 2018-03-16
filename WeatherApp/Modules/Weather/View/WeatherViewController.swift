//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewInput {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var infoPageControl: UIPageControl!
    @IBOutlet weak var cityImageView: UIImageView!
    
    
    var presenter: WeatherViewOutput!
    
    //Collection View variables
    var currentWeatherInfoCount: Int?
    var currentWeatherInfoTitle: String?
    var currentWeatherInfo: String?
    let infoCellIdentifier = "infoCell"
    
    let collectionViewBorderWidth: CGFloat = 1.0
    let collectionViewCornerRadius: CGFloat = 3.0

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    // MARK: - view input
    
    func prepareCollectionView() {
        let infoCellNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoCellNib, forCellWithReuseIdentifier: infoCellIdentifier)
        
        infoCollectionView.layer.borderColor = UIColor.black.cgColor
        infoCollectionView.layer.borderWidth = collectionViewBorderWidth
        infoCollectionView.layer.cornerRadius = collectionViewCornerRadius
    }
    
    func setState(_ state: String) {
        stateLabel.text = state
    }
    
    func setTemperature(_ temperature: String) {
        temperatureLabel.text = temperature
    }
    
    func setSunriseTime(_ time: String) {
        sunriseLabel.text = time
    }
    
    func setSunsetTime(_ time: String) {
        sunsetLabel.text = time
    }
    
    func setCityTitle(_ title: String) {
        self.title = title
    }
    
    func setCurrentWeatherInfoTitle(_ title: String) {
        currentWeatherInfoTitle = title
    }
    
    func setCurrentWeatherInfo(_ info: String) {
        currentWeatherInfo = info
    }
    
    func setCurrentWeatherInfoCount(_ count: Int) {
        currentWeatherInfoCount = count
    }
    
    func reloadCollectionView() {
        infoCollectionView.reloadData()
    }
    
    func updatePageCount() {
        infoPageControl.numberOfPages = currentWeatherInfoCount ?? 0
    }
    
    func setCityImage(_ image: UIImage) {
        cityImageView.image = image
    }

}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.updateCurrentWeatherInfoCount()
        return currentWeatherInfoCount ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: infoCellIdentifier, for: indexPath) as! InfoCollectionViewCell
        
        presenter.updateCurrentWeatherInfo(at: indexPath)
        cell.setTitle(currentWeatherInfoTitle)
        cell.setInfo(currentWeatherInfo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        infoPageControl.currentPage = indexPath.row
    }
    
}
