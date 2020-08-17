import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var secondName: UITextField!
  
  
  @IBAction func saveButton(_ sender: Any) {
    Human.shared.firstName = firstName.text
    Human.shared.secondName = secondName.text
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()
      firstName.text = Human.shared.firstName
      secondName.text = Human.shared.secondName
      print("firstname " + (Human.shared.firstName ?? " "))
      print("secondname " + (Human.shared.secondName ?? " "))
    }
}
