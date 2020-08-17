import UIKit

class ThirdViewController: UIViewController {

  @IBOutlet weak var weatherImage: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var mainLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var pressureLabel: UILabel!
  
  @IBOutlet weak var tableView: UITableView!
  
  
  var weathers:[WeatherData] = []
  var weathers1:[WeatherData] = []
  
    override func viewDidLoad() {
      self.tableView.rowHeight = UITableView.automaticDimension;
      self.tableView.estimatedRowHeight = 99.0;
      
        super.viewDidLoad()
      
      AlamoWeatherLoader1().loadWeather2 { (weathers) in
        if  WeatherStorage.shared.description != nil{
          self.mainLabel.text = WeatherStorage.shared.main
          self.descriptionLabel.text = WeatherStorage.shared.description
          self.tempLabel.text = WeatherStorage.shared.temp
          self.pressureLabel.text = WeatherStorage.shared.pressure
          self.humidityLabel.text = WeatherStorage.shared.humidity
          if UserDefaults.standard.object(forKey: "image") != nil{
            let data = UserDefaults.standard.object(forKey: "image") as! NSData
            self.weatherImage.image = UIImage(data: data as Data)
          }
        }
        
         self.weathers1 = weathers
         print(self.weathers1)
         self.mainLabel.text = String(self.weathers1[0].weather[0].main)
         self.descriptionLabel.text = self.weathers1[0].weather[0].description
         self.tempLabel.text = "temp: " + String(Int(self.weathers1[0].main.temp - 273.15))
         self.pressureLabel.text = "pressure: " + String(self.weathers1[0].main.pressure)
         self.humidityLabel.text = String(self.weathers1[0].main.humidity)
         let url = URL(string: "https:/openweathermap.org/img/wn/\(self.weathers1[0].weather[0].icon).png")
         let data = try? Data(contentsOf: url!)
         self.weatherImage.image = UIImage(data: data!)
         self.saveDataWeather()
       }
      
       AlamofireWeatherLoader2().loadWeather2 { weathers in
         self.weathers = weathers
         self.tableView.reloadData()
       }
    }
  
  
  func saveDataWeather(){
    if weathers1.isEmpty{
      return
    } else {
      WeatherStorage.shared.description = self.descriptionLabel.text
      WeatherStorage.shared.humidity  = self.humidityLabel.text
      let imageData = self.weatherImage.image?.jpegData(compressionQuality: 0.75)
      UserDefaults.standard.set(imageData, forKey: "image")
      WeatherStorage.shared.main = self.mainLabel.text
      WeatherStorage.shared.pressure = self.pressureLabel.text
      WeatherStorage.shared.temp = self.tempLabel.text
    }
  }
    
}



extension ThirdViewController: UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WeatherTableViewCell
        let model = weathers[indexPath.row]
      
      
      
      if  WeatherStorage.shared.description != nil{
       cell.mainLabel.text = WeatherStorage.shared.main
       cell.descriptionLabel.text = WeatherStorage.shared.description
       cell.tempLabel.text = WeatherStorage.shared.temp
       cell.pressureLabel.text = WeatherStorage.shared.pressure
       cell.humidityLabel.text = WeatherStorage.shared.humidity
       if UserDefaults.standard.object(forKey: "image") != nil{
         let data = UserDefaults.standard.object(forKey: "image") as! NSData
         cell.weatherImage.image = UIImage(data: data as Data)
       }
      }
        
        cell.mainLabel.text = String(model.weather[0].main)
        cell.descriptionLabel.text = model.weather[0].description
        cell.tempLabel.text = "temp: " + String(Int(model.main.temp - 273.15))
        cell.pressureLabel.text = "pressure: " + String(model.main.pressure)
        cell.humidityLabel.text = String(model.main.humidity)
        let url = URL(string: "https:/openweathermap.org/img/wn/\(model.weather[0].icon).png")
        let data = try? Data(contentsOf: url!)
        cell.weatherImage.image = UIImage(data: data!)
      
      WeatherStorage.shared.description = cell.descriptionLabel.text
      WeatherStorage.shared.humidity  = cell.humidityLabel.text
      let imageData = cell.weatherImage.image?.jpegData(compressionQuality: 0.75)
      UserDefaults.standard.set(imageData, forKey: "image")
      WeatherStorage.shared.main = cell.mainLabel.text
      WeatherStorage.shared.pressure = cell.pressureLabel.text
      WeatherStorage.shared.temp = cell.tempLabel.text
      
        return cell
    }
  
}

