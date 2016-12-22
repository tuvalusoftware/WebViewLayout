//
//  ChartData.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/21/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit
import ObjectMapper


class ChartMessage: Mappable {
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    public func mapping(map: Map) {
        label <- map["label"]
        series <- map["series"]
        data <- map["data"]
        chartType <- map["chartType"]
        element_key  <- map["element_key"]
    }

    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    required init?(map: Map) {
        
    }
 
    required init( ) {
        
    }
    
 
    var label: [String]!
    var series: [String]!
    var data: [[Int]]!
    var chartType:String!
    var element_key:String!
    
    
    
    
}
