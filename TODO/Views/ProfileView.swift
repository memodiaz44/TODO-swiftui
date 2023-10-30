//
//  ProfileView.swift
//  TODO
//
//  Created by Adel Diaz on 08/10/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ModelViewApp
    
    var body: some View {
        VStack {
            if let user = viewModel.session {
                           Text("Hello \(user.email)")
                UButton(text: "mena", color: .blue){
                    viewModel.signOut()
                }
                MyTabView()
            }else {
                Text("Hello yud")
            }
           
        }
   
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ModelViewApp())
    }
}
