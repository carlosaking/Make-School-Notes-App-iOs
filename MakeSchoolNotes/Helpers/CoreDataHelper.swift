//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Carlos A. on 6/30/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    //static methods will go here
    static func doSomething() {
        
    }
    
    static func crateNote () -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Cloud not save \(error)")
        }
    }
    
    static func deleteNote(note: Note) {
        managedContext.delete(note)
        saveNote()
    }
    
    static func retrieveNote() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return []
    }
}
