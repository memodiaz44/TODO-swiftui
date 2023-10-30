//
//  AddTaskView.swift
//  TODO
//
//  Created by Adel Diaz on 08/10/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskModel = TaskModel()
    @Binding var slideView: Bool
    @Binding var selectedTaskID: String
    @State private var updatedTaskName = ""
    
    var body: some View {
            HStack {
                Form {
                    if slideView {
                        TextField("Updated Title", text: $updatedTaskName)
                        Button {
                            let updatedData: [String: Any] = [
                                "name": updatedTaskName //
                            ]
                            taskModel.updateTask(selectedTaskID, with: updatedData)
                            slideView = false

                        } label: {
                            Text("Update")
                        }
                    } else {
                        TextField("title", text: $taskModel.todoTitle)
                        Button {
                            taskModel.createTask()
                        } label: {
                            Text("Add Task")
                        }
                    }
                }
            }
        }
    }

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(slideView: .constant(false), selectedTaskID: .constant("SomeTaskID"))
    }
}
