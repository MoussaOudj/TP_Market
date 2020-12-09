//
//  Marketplace.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 03/12/2020.
//
// 20201203154131
// https://moc4a-poi.herokuapp.com/stores

//[
//  {
//    "name": "LDLC Beaugrenelle",
//    "location": {
//      "lat": 48.845169,
//      "lon": 2.285416
//    },
//    "products": [
//      {
//        "name": "ASRock Radeon RX 6800 16G",
//        "image": "https://media.ldlc.com/r1600/ld/products/00/05/75/08/LD0005750884_1.jpg",
//        "price": 719.95,
//        "stock": 0
//      },
//      {
//        "name": "Gigabyte Radeon RX 6800 XT 16G",
//        "image": "https://media.ldlc.com/r1600/ld/products/00/05/75/08/LD0005750877_1.jpg",
//        "price": 929.95,
//        "stock": 0
//      }
//    ]
//  },
//  {
//    "name": "Materiel.net",
//    "location": {
//      "lat": 48.869563,
//      "lon": 2.577244
//    },
//    "products": [
//      {
//        "name": "Sapphire Radeon RX 6800 XT",
//        "image": "https://media.materiel.net/r550/products/MN0005751246_1.jpg",
//        "price": 799.96,
//        "stock": 0
//      }
//    ]
//  }
//]

import Foundation
public class Marketplace {
    
    let name:String
    let location:Coordinate
    let products:[Product]
    
    init(name:String, location:Coordinate, products:[Product]) {
        self.name = name
        self.location = location
        self.products = products
    }
    
}


extension Marketplace:CustomStringConvertible{
    public var description: String {
        return "name : \(self.name) location : \(self.location) products : \(self.products)"
    }
}
