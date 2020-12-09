//
//  Products.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 03/12/2020.
//

import Foundation
/*  {
 //        "name": "Sapphire Radeon RX 6800 XT",
 //        "image": "https://media.materiel.net/r550/products/MN0005751246_1.jpg",
 //        "price": 799.96,
 //        "stock": 0
 //      }*/
public class Product{
    let name:String
    let image:String
    let price:Double
    let stock:Int
    
    init(name:String, image:String, price:Double, stock:Int) {
        self.name = name
        self.image = image
        self.price = price
        self.stock = stock
    }
}

extension Product:CustomStringConvertible{
    public var description: String{
        return "Product[name : \(self.name) image : \(self.image) price : \(self.price) stock : \(self.stock)]"
    }
}
