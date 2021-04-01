//
//  DailyWheather.swift
//  HW14
//
//  Created by mac on 31.03.2021.
//

import Foundation
import RealmSwift

protocol DailyWheatherLoaderDelegate {
    func updateDailyWheather()
}

class WheatherRealm: Object {
    
    @objc dynamic var date = String()
    @objc dynamic var temp = Double()
    @objc dynamic var feelsLike = Double()
    
}

var WheatherList: Results<WheatherRealm>!

struct DailyWheather: Decodable {
    let list: [List]
}
struct List: Decodable {
    let dt_txt: String
    let main: Main
}
struct Main: Decodable {
    let temp: Double
    let feels_like: Double
}


var delegate: DailyWheatherLoaderDelegate?
var dailiWheatherDelegate: DailyWheather?

func getDailyWheather(){
let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appid=1e2d102e87d25afa699664c4340f1530"
 
    guard let url = URL(string: urlString) else {return}
    
URLSession.shared.dataTask(with: url) { (data, responce, error) in
    guard let data = data else {return}
    guard error == nil else {return}
    
    do {
        let dailyWheather = try JSONDecoder().decode(DailyWheather.self, from: data)
            dailiWheatherDelegate = dailyWheather
        
            
        
        DispatchQueue.main.async {
            for item in dailiWheatherDelegate!.list {
            let items = WheatherRealm()
                items.date = item.dt_txt
                items.temp = item.main.temp
                items.feelsLike = item.main.feels_like
                try! realm.write {
                    realm.add(items)
                }
            }
            delegate?.updateDailyWheather()
        }
            
    
    }catch let error {
        print(error)
    }
}.resume()
    
}

