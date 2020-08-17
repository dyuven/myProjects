import Foundation

class WeatherStorage{
  static let shared = WeatherStorage()
  
  private let kMainKey = "WeatherStorage.kMainKey"
  private let kDescriptionKey = "WeatherStorage.kDescriptionKey"
  private let kIconKey = "WeatherStorage.kIconKey"
  private let kTempKey = "WeatherStorage.kTempKey"
  private let kPressureKey = "WeatherStorage.kPressureKey"
  private let kHumidityKey = "WeatherStorage.kHumidityKey"
 
  
  
  var main: String? {
    set { UserDefaults.standard.set(newValue, forKey: kMainKey) }
    get { return  UserDefaults.standard.string(forKey: kMainKey) }
  }
  
  
  var description: String? {
    set { UserDefaults.standard.set(newValue, forKey: kDescriptionKey) }
    get { return  UserDefaults.standard.string(forKey: kDescriptionKey) }
  }
  
//  var icon: String? {
//    set { UserDefaults.standard.set(newValue, forKey: kIconKey) }
//    get { return  UserDefaults.standard.string(forKey: kIconKey) }
//  }
  
  var temp: String? {
    set { UserDefaults.standard.set(newValue, forKey: kTempKey) }
    get { return  UserDefaults.standard.string(forKey: kTempKey) }
  }
  
  var pressure: String? {
    set { UserDefaults.standard.set(newValue, forKey: kPressureKey) }
    get { return  UserDefaults.standard.string(forKey: kPressureKey) }
  }
  
  var humidity: String? {
    set { UserDefaults.standard.set(newValue, forKey: kHumidityKey) }
    get { return  UserDefaults.standard.string(forKey: kHumidityKey) }
  }
  
}

