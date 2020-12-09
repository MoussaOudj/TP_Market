//
//  MarketRequester.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 03/12/2020.
//

import Foundation
import Alamofire
public class MarketRequester{
    
    
    /*AF.request("https://mbd.cookcountysupernetwork.com/ap/swift_math_get.asp", method: .post,  parameters: parameters, encoding: JSONEncoding.default)
     .responseJSON { response in
     switch response.result {
     case .success(let value):
     if let json = value as? [String: Any] {
     print(json["Result"] as? Int)
     }
     case .failure(let error):
     print(error)
     }
     }*/
//
//    func requestForUserDataWith(completionHandler: (_ result: [String: Any], _ error: Error) -> Void){
//
//    }
//
    func requestForMarket(completionHandler: @escaping (_ result: [Marketplace]) -> Void ){
        
        var marketList:[Marketplace] = []
        
        AF.request("https://moc4a-poi.herokuapp.com/stores").responseJSON { response in
            
            
            
            switch response.result {
            case .success(let value):
                print("RESPONSE SUCCESS")
                if let json = value as? [[String: Any]] {
                    json.forEach { market in
                        var productList:[Product] = []
                        
                        guard let name = market["name"] as? String else {return}
                        
                        guard let location = market["location"] as? [String:Any] else {return}
                        guard let lon = location["lon"] as? Double else {return}
                        guard let lat = location["lat"] as? Double else {return}
                        
                        let locationModel = Coordinate(longitude: lon, latitude: lat)
                        
                        guard let products = market["products"] as? [[String:Any]] else {return}
                        products.forEach {
                            product in
                            guard let name = product["name"] as? String else {return}
                            guard let image = product["image"] as? String else {return}
                            guard let price = product["price"] as? Double else {return}
                            guard let stock = product["stock"] as? Int else {return}
                            
                            productList.append(Product(name: name, image: image, price: price, stock: stock))
                        }
                        
                        marketList.append(Marketplace(name: name, location: locationModel, products: productList))
                        
                    }
                    
                    completionHandler(marketList)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
