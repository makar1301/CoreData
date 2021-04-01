//
//  WheatherViewController.swift
//  HW14
//
//  Created by mac on 25.03.2021.
//

import UIKit

class WheatherViewController: UIViewController, DailyWheatherLoaderDelegate {

    @IBOutlet weak var wheatherTableView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var wheatherLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!

    func updateDailyWheather(){
        wheatherTableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        WheatherList = realm.objects(WheatherRealm.self)
        updateDailyWheather()
        wheatherTableView.backgroundColor = .systemBlue
        
        cityLabel.text = Wheather.shared2.city
        wheatherLabel.text = "\(Int(Wheather.shared2.wheather ?? 0)) ºC"
        feelsLikeLabel.text = "Ощущается как \(Int(Wheather.shared2.feelsLike ?? 0))ºC"
        loadedWheather()
        getDailyWheather()
      
        
    }
    
    private func loadedWheather() {
       var cityName: String?
       var temp: Double?
       var feelsLike: Double?
       let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=dacda99f789972c741181a121168023c&units=metric"
       let url = URL(string: urlString)
       let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
           do {
               let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                   cityName = json["name"] as? String

               if let main = json["main"] {
                   feelsLike = main["feels_like"] as? Double
                   temp = main["temp"] as? Double
               }
               DispatchQueue.main.async {
//                   self.feelsLikeLabel.text = "Ощущается как \(Int(feelsLike!))ºC"
//                   self.wheatherLabel.text = "\(Int(temp!))ºC"
//                   self.cityLabel.text = cityName
                Wheather.shared2.city = cityName
                Wheather.shared2.wheather = temp
                Wheather.shared2.feelsLike = feelsLike
                self.cityLabel.text = Wheather.shared2.city
                self.wheatherLabel.text = "\(Int(Wheather.shared2.wheather ?? 0)) ºC"
                self.feelsLikeLabel.text = "Ощущается как \(Int(Wheather.shared2.feelsLike ?? 0))ºC"
               }
           }
           catch let jsonError {
               print(jsonError)
           }
       }
       task.resume()
   }

}


extension WheatherViewController: UITableViewDataSource, UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "WheatherCell", for: indexPath) as! WheatherTableViewCell
    
    let item = WheatherList[indexPath.row]
    cell.dataLabel?.text = item.date

    cell.dailyTempLabel?.text = "\(Int(item.temp))"

    cell.dailyFeelsLikeLabel.text = "\(Int(item.feelsLike))"
           cell.backgroundColor = .systemBlue
       cell.dataLabel.textColor = .white
       cell.dailyTempLabel.textColor = .white
       cell.dailyFeelsLikeLabel.textColor = .white
       return cell
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if WheatherList.count != 0 { return WheatherList.count}
    return 0
   }
}

    


