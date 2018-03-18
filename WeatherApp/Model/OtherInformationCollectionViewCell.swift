//
//  OtherInformationCollectionViewCell.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 16.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class OtherInformationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var otherCellImageView: UIImageView!
    @IBOutlet weak var cellDescriptionTextView: UITextView!
    @IBOutlet weak var cellName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func prepareCell(description:String, name: String) {
        cellDescriptionTextView.text = description
        cellName.text = name
        
    }

}
