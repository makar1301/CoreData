//
//  WheatherUserDefaults.swift
//  HW14
//
//  Created by mac on 31.03.2021.
//

import Foundation


class Wheather {
    static let shared2 = Wheather()
    
    private let cityLabelKey = "Wheather.cityLabelKey"
    private let wheatherLabelKey = "Wheather.wheatherLabelKey"
    private let feelsLikeLabelKey = "Wheather.feelsLikeLabelKey"
   
    var city: String? {
        set{ UserDefaults.standard.set(newValue, forKey: cityLabelKey) }
        get { return UserDefaults.standard.string(forKey: cityLabelKey)}
    }
    var wheather: Double? {
        set{ UserDefaults.standard.set(newValue, forKey: wheatherLabelKey) }
        get { return UserDefaults.standard.double(forKey: wheatherLabelKey)}
    }
    var feelsLike: Double? {
        set{ UserDefaults.standard.set(newValue, forKey: feelsLikeLabelKey) }
        get { return UserDefaults.standard.double(forKey: feelsLikeLabelKey)}
    }
    
 
    
    
    
}
