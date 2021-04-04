//
//  CoreDataViewController.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableToDo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableToDo.delegate = self
        tableToDo.dataSource = self
        CoreDataManager.sharedManager.getDataFromDB()
    }
    
    //MARK - Add DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.sharedManager.toDoList.count//toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CoraTableViewCell
        let item = CoreDataManager.sharedManager.toDoList[indexPath.row]
        cell.textTask.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK - Add Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = CoreDataManager.sharedManager.toDoList[indexPath.row]
        item.done = !item.done
        CoreDataManager.sharedManager.contextSave().self
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.tableToDo.setEditing(true, animated: true)
            CoreDataManager.sharedManager.delete(object:  CoreDataManager.sharedManager.toDoList[indexPath.row])
            
            tableView.reloadData()
        }
    }
    
    @IBAction func addTaskAction(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Создайте новую задачу", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите текст"
        }
        let alertCansel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(alertCansel)
        
        let alertCreate = UIAlertAction(title: "Сохранить", style: .cancel) { action in
            let newItem = alertController.textFields?.first
            let newDone = false
            let newTaskTitle = newItem?.text
            CoreDataManager.sharedManager.saveTask(withTitle: newTaskTitle!, withDone: newDone)
            
            self.tableToDo.reloadData()
        }
        alertController.addAction(alertCreate)
        present(alertController, animated: true, completion: nil)
    }
}
