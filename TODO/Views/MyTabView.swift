//
//  MyTabView.swift
//  TODO
//
//  Created by Adel Diaz on 12/10/23.
//

import SwiftUI

struct MyTabView: View {
    @State private var slideView: Bool = false

    @State private var selectedTaskID: String = ""
    var body: some View {
        TabView {
            AddTaskView(slideView:  $slideView, selectedTaskID: $selectedTaskID)
                .tabItem{
                    Image(systemName: "pencil")
                }
            ShowTask()
                .tabItem{
                 Image(systemName: "list.bullet.rectangle.portrait")
                }
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
