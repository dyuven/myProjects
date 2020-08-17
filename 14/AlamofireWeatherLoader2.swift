import Foundation
import Alamofire

class AlamofireWeatherLoader2{
  
  var weatherData2 = WeatherData7()
  var weathers:[WeatherData] = []
  
  
  func loadWeather2(completion: @escaping([WeatherData]) -> Void){
    AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&cnt=7&APPID=c6b306ad97629045b336be075835a207").responseData { (response) in
 //     print(response)
        if let objects = response.value{
//          print(objects)
            do {
              self.weatherData2 = try JSONDecoder().decode(WeatherData7.self, from: objects )
                 self.weathers = self.weatherData2.list
                 print(self.weathers.count)
                 DispatchQueue.main.async {
                 completion(self.weathers)
              }
            } catch { print(error) }
          }
      }
    }
}
