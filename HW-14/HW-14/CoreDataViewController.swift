//
//  CoreDataViewController.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 24.03.2021.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableToDo: UITableView!
    
    var toDoList:[DoList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableToDo.delegate = self
        tableToDo.dataSource = self
        
        let context = getContext()
        let fetchRequest: NSFetchRequest<DoList> = DoList.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            toDoList = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    //MARK - Add DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CoraTableViewCell
        let item = toDoList[indexPath.row]
        cell.textTask.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK - Add Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoList[indexPath.row].done = !toDoList[indexPath.row].done
        let context = getContext()
        do{
            try context.save()
        }catch {
            print("Error saving context with \(error)")
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = getContext()
        let fetchRequest: NSFetchRequest<DoList> = DoList.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if editingStyle == .delete {
            self.tableToDo.setEditing(true, animated: true)
            context.delete(toDoList[indexPath.row])
            
            do{
                toDoList = try context.fetch(fetchRequest)
                try context.save()
            }     catch let error as NSError {
                print(error)
            }
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
            self.saveTask(withTitle: newTaskTitle!, withDone: newDone)
            
            self.tableToDo.reloadData()
        }
        alertController.addAction(alertCreate)
        present(alertController, animated: true, completion: nil)
    }
    
    private func saveTask(withTitle title: String, withDone done: Bool) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "DoList", in: context) else {return}
        
        let taskObject = DoList(entity: entity, insertInto: context)
        taskObject.title = title
        taskObject.done = false
        do{
            try context.save()
            toDoList.append(taskObject)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
