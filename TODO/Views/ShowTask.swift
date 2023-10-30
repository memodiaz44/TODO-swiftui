//
//  ShowTask.swift
//  TODO
//
//  Created by Adel Diaz on 09/10/23.
//

import SwiftUI

struct ShowTask: View {
    @ObservedObject var taskModel = TaskModel()
    @State var slideView = false
    @State private var selectedTaskID: String = ""

    
    
    var body: some View {
        List(taskModel.todoItems, id: \.id) { task in
            VStack{
                Text(task.name)
                Button("take on me"){
                    self.selectedTaskID = task.id
                    slideView.toggle()
                    
                }
                    .swipeActions {
                        Button {
                            taskModel.delete(task.id)
                        }label: {
                            Text("pan virote")
                                .tint(Color.red)
                        }
                    }
                    
            }
        }
        .onAppear {
            self.taskModel.getTask()
        }
        .sheet(isPresented: $slideView){
            AddTaskView(slideView: $slideView, selectedTaskID: $selectedTaskID)
        }
    }
}



struct ShowTask_Previews: PreviewProvider {
    static var previews: some View {
        ShowTask()
        
    }
}
