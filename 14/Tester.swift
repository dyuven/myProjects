import Foundation
import RealmSwift


class task: Object{
  @objc dynamic var taskName = ""

}


class Tester{
  static let shared = Tester()
  
  private let realm = try! Realm()
  
  func test(){
    

    let task2 = task()
    let newTask = task()
    
    task2.taskName = "task in list2"

    newTask.taskName = "first task"
    
//    try! realm.write {
//      realm.add(task2)
//      realm.add(newTask)
//    }
    
 //   let allTasks = realm.objects(task.self)
 //   let CommonList = realm.objects(todoList.self).first!
    
 //   let firstTask = realm.objects(task.self).first!
    
//    try! realm.write {
//      realm.delete(firstTask)
//    }
    
//    try! realm.write {
//      for task in allTasks{
//        task.taskName = "fisrt task"
//      }
//    }
    
//    for task in allTasks{
//      print("--" + task.taskName)
//    }
    
    
    
//    for taskOfList in CommonList{
//      print("--" + "\(taskOfList.tasks)")
//    }
  }
}


