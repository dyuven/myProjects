import Foundation


class Human{
  static let shared = Human()
  
  private let kFirstnameKey = "Human.kFirstnameKey"
  private let kSecondnameKey = "Human.kSecondnameKey"
  
  var firstName: String? {
    set { UserDefaults.standard.set(newValue, forKey: kFirstnameKey) }
    get { return  UserDefaults.standard.string(forKey: kFirstnameKey) }
  }
  
  
  var secondName: String? {
    set { UserDefaults.standard.set(newValue, forKey: kSecondnameKey) }
    get { return  UserDefaults.standard.string(forKey: kSecondnameKey) }
  }
  
}
