//
//  InfoCollectionViewCell.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 09.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    func setTitle(_ title: String?) {
        titleLabel.text = title
    }
    
    func setInfo(_ info: String?) {
        infoLabel.text = info
    }

}
