import Foundation
import Alamofire

class AlamoWeatherLoader1{
  
  var weatherData = WeatherData()
  var weathers:[WeatherData] = []
  
  
  func loadWeather2(completion: @escaping([WeatherData]) -> Void){
    AF.request("https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=c6b306ad97629045b336be075835a207").responseData { (response) in
 //     print(response)
        if let objects = response.value{
//          print(objects)
            do {
              self.weatherData = try JSONDecoder().decode(WeatherData.self, from: objects )
                 self.weathers.append(self.weatherData)
                 print(self.weathers.count)
                 DispatchQueue.main.async {
                 completion(self.weathers)
              }
            } catch { print(error) }
          }
      }
    }
}
