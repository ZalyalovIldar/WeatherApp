//
//  WeatherCellViewModel.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 16.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

struct WeatherCellViewModel{
    let url: URL
    let description: String
    let descriptionName: String
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageData = try? Data(contentsOf: url) else { return }
        let image = UIImage(data: imageData)
        DispatchQueue.main.async { completion(image) }
    }
}
