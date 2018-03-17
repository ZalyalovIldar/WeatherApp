//
//  MapInfo.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

struct MapInfo: Codable {
    
    let value: [Value]
    
    struct Value: Codable {
        let contentUrl: String
    }
    
}

extension MapInfo {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopCodingKeys.self)
        var meta = try container.nestedUnkeyedContainer(forKey: .value)
        var values : [Value] = []
        while !meta.isAtEnd {
            let value = try meta.decode(Value.self)
            values.append(value)
        }
        
        self.init(value: values)
        
    }
}

enum TopCodingKeys: String, CodingKey {
    case value
}

