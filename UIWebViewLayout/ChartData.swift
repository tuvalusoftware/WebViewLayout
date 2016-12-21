//
//  ChartData.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/21/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit
import ObjectMapper


class ChartData: Mappable {
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    public func mapping(map: Map) {
        label <- map["label"]
        series <- map["series"]
        data <- map["data"]
    }

    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    required init?(map: Map) {
        
    }

    
    var label: [String]!
    var series: [String]!
    var data: [[Int]]!
    
}
