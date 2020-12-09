//
//  Coordinate.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 03/12/2020.
//

import Foundation
public class Coordinate{
    let longitude:Double
    let latitude:Double
    
    init(longitude:Double, latitude:Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

extension Coordinate:CustomStringConvertible{
    public var description: String{
        return "[longitude : \(self.longitude) latitude : \(self.latitude)]"
    }
}
