//
//  ImageStruct.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct Image: Codable {
    struct Items: Codable {
        struct Pagemap: Codable {
            struct Cse_thumbnail: Codable {
                let src: String?
            }
            let cse_thumbnail: [Cse_thumbnail]?
        }
        let pagemap: Pagemap?
    }
    let items: [Items]
}
