//
//  ContentView.swift
//  TODO
//
//  Created by Adel Diaz on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel =  ModelViewApp()
    
  
    var body: some View {
        NavigationView {
            if !viewModel.signedin {
                Login(viewModel: viewModel)
                }
            else {
                VStack{
                    ProfileView(viewModel: viewModel)
                }
                
            }
            
        }
        .onAppear {
            viewModel.signedin = viewModel.isSignedin
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
               ContentView()
    }
}
