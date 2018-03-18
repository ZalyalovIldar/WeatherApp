//
//  WeatherInfoViewController.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class WeatherInfoViewController: UIViewController, WeatherInfoInput, ModuleInputHolder {
    
    var presenter: WeatherInfoOutput!
    var moduleInput: ModuleInput?
 
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var infoPageControl: UIPageControl!
    
    //Collection View variables
    var currentWeatherInfoCount: Int?
    var currentWeatherInfoTitle: String?
    var currentWeatherInfoText: String?
    let infoCellIdentifier = "infoCell"
    let collectionViewBorderWidth: CGFloat = 1.0
    let collectionViewCornerRadius: CGFloat = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    // MARK: - View Input
    
    func prepareCollectionView() {
        let infoCellNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        infoCollectionView.register(infoCellNib, forCellWithReuseIdentifier: infoCellIdentifier)
        
        infoCollectionView.layer.borderColor = UIColor.black.cgColor
        infoCollectionView.layer.borderWidth = collectionViewBorderWidth
        infoCollectionView.layer.cornerRadius = collectionViewCornerRadius
    }
    
    func set(currentWeatherInfoTitle title: String) {
        currentWeatherInfoTitle = title
    }
    
    func set(currentWeatherInfoText text: String) {
        currentWeatherInfoText = text
    }
    
    func set(currentWeatherInfoCount count: Int) {
        currentWeatherInfoCount = count
        infoPageControl.numberOfPages = count
    }
    
    func refreshCollectionView() {
        infoCollectionView.reloadData()
    }
    
}

extension WeatherInfoViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.updateCurrentWeatherInfoCount()
        return currentWeatherInfoCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: infoCellIdentifier, for: indexPath) as! InfoCollectionViewCell
        
        presenter.updateCurrentWeatherInfo(at: indexPath)
        cell.setTitle(currentWeatherInfoTitle)
        cell.setInfo(currentWeatherInfoText)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        infoPageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}
