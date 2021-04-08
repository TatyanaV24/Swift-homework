//
//  CoreDataManager.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 03.04.2021.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    var toDoList: [DoList] = []
    static let sharedManager = CoreDataManager()
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getDataFromDB() {
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
    
    func saveTask(withTitle title: String, withDone done: Bool) {
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
    
    func delete(object: DoList){
        let context = getContext()
        let fetchRequest: NSFetchRequest<DoList> = DoList.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            context.delete(object)
            toDoList = try context.fetch(fetchRequest)
            try context.save()
        }     catch let error as NSError {
            print(error)
        }
    }
    
    func contextSave(){
        let context = getContext()
        do{
            try context.save()
        }catch {
            print("Error saving context with \(error)")
        }
    }
}
