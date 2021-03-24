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
        return cell
    }
    
    //MARK - Add Delegate Methods

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        let context = getContext()
        let fetchRequest: NSFetchRequest<DoList> = DoList.fetchRequest()

        if editingStyle == .delete {
            self.tableToDo.setEditing(true, animated: true)
            context.delete(toDoList.reversed()[indexPath.row])

            do{
                toDoList = try context.fetch(fetchRequest)

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
            
           let newTaskTitle = newItem?.text
            
            self.saveTask(withTitle: newTaskTitle!)
                self.tableToDo.reloadData()
           }
        
        alertController.addAction(alertCreate)
        present(alertController, animated: true, completion: nil)
    }
    
    private func saveTask(withTitle title: String) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "DoList", in: context) else {return}
        
        let taskObject = DoList(entity: entity, insertInto: context)
        taskObject.title = title
        
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
