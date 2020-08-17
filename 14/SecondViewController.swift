import UIKit
import RealmSwift

var todos: Results<task>!
let realm = try! Realm()

class SecondViewController: UIViewController {
  
  
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var taskTableView: UITableView!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      todos = realm.objects(task.self)
      self.taskTableView.rowHeight = UITableView.automaticDimension;
      self.taskTableView.estimatedRowHeight = 44.0;
    }

  @IBAction func addTask(_ sender: Any) {
    let newTask = task()
    newTask.taskName = taskTextField.text ?? " "
    try! realm.write{
      realm.add(newTask)
      taskTableView.reloadData()
    }
  }
}


extension SecondViewController: UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TaskTableViewCell
      let task = todos[indexPath.row]
      cell.task1Label.text = task.taskName
      return cell
    }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete{
//      let deleteTask = task()
      let deleteTask = todos[indexPath.row]
      try! realm.write {
        realm.delete(deleteTask)
      }
      tableView.deleteRows(at: [indexPath], with: .top)
      
    }
  }
}
