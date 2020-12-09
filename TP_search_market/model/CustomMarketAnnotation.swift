//
//  CustomMarketAnnotation.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 09/12/2020.
//

import Foundation
import MapKit
public class CustomMarketAnnotation: MKPointAnnotation{
    var productList:[Product]
    
    init(products:[Product]) {
        self.productList = products
    }
}
