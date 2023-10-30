//
//  ModelTask.swift
//  TODO
//
//  Created by Adel Diaz on 29/09/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskModel: ObservableObject {
    @Published var todoTitle: String = ""
    @Published var todoItems = [Task]()
  

    private var userID: String?
    
    init() {
          guard let userID = Auth.auth().currentUser?.uid else { return }
          self.userID = userID
      }



    func createTask() {
        guard let userID = self.userID, !todoTitle.isEmpty else { return }

            let taskId = UUID().uuidString
            
            let newTask = Task(id: taskId, name: todoTitle, date: Date() )
            todoItems.append(newTask)
            
           
            todoTitle = ""
            
        let db = Firestore.firestore()
        let userTasksCollection = db.collection("users").document(userID).collection("tasks")
         
         // Use `addDocument` to create a new document with a random unique ID
         userTasksCollection.addDocument(data: [
             "id": newTask.id,
             "name": newTask.name,
             "date": newTask.date
         ])
        }
    
    func getTask() {
        guard let userID = self.userID else { return }
        let db = Firestore.firestore()
                let userTasksCollection = db.collection("users").document(userID).collection("tasks")
        
                userTasksCollection.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            var tasks: [Task] = []
            
            for document in documents {
                let data = document.data()
                let id = document.documentID
                let name = data["name"] as? String ?? ""
                let timestamp = data["date"] as? Timestamp
                
                let date: Date?
                if let timestamp = timestamp {
                    date = timestamp.dateValue()
                } else {
                    date = nil
                }
                
                tasks.append(Task(id: id, name: name, date: date ?? Date()))
            }
            
            // Append the new tasks to the existing array
            self.todoItems.append(contentsOf: tasks)
        }
    }
    
    func delete (_ document: String ){
        guard let userID = self.userID else { return }
        let db =  Firestore.firestore()
        
        db.collection("users").document(userID).collection("tasks").document(document).delete() { err in
            if let err = err {
                print("error deleting file \(err)")
            }else {
                print("removed succesfully")
            }
            
        }
    }
    
    func updateTask(_ document: String, with newData: [String: Any]) {
        guard let userID = self.userID else { return }
        let db = Firestore.firestore()
        db.collection("users").document(userID).collection("tasks").document(document).updateData(newData) { error in
            if let error = error {
                print("Error updating task: \(error)")
            } else {
                print("Task updated successfully!")
            }
        }
    }


    
    }
