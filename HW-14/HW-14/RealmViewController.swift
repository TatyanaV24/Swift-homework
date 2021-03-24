//
//  Realm.swift
//  HW-14
// Список Todo с возможностью добавления и удаления задач, в котором задачи кешируются в Realm, а при повторном запуске показываются последние сохранённые задачи.

//  Created by Татьяна Васильченко on 22.03.2021.
//

import UIKit
import RealmSwift

// Model
class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var isCompleted = false
}

class RealmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    @IBOutlet weak var toDoTable: UITableView!
    
    var toDoList: Results<Task>{
        get {
            return realm.objects(Task.self)
        }
    }

    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTable.delegate = self
        toDoTable.dataSource = self
    }
    
    //MARK - Add DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskViewCell
        let item = toDoList[indexPath.row]
        cell.TaskLabel.text = item.name
        return cell
    }
    
    //MARK - Add Delegate Methods

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let item = toDoList[indexPath.row]
            
            try! realm.write{
                self.realm.delete(item)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } 
    }

    @IBAction func addAction(_ sender: UIBarButtonItem) { // добавление новой задачи при нажатии на кнопку +
        let alertController = UIAlertController(title: "Создайте новую задачу", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите текст"
        }
        
        let alertCansel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(alertCansel)
        
        let alertCreate = UIAlertAction(title: "Сохранить", style: .cancel) { (UIAlertAction) in
            
            let newItem = (alertController.textFields?.first)! as UITextField
            
            let newTask = Task()
            newTask.name = newItem.text!
            
            try! self.realm.write{
                self.realm.add(newTask)
                
                self.toDoTable.insertRows(at: [IndexPath.init(row: self.toDoList.count-1, section: 0)], with: .automatic)
            }
        }
        alertController.addAction(alertCreate)
        present(alertController, animated: true, completion: nil)
    }
}
