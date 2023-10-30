//
//  SignIn .swift
//  TODO
//
//  Created by Adel Diaz on 30/09/23.
//

import SwiftUI


struct SignIn_: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: ModelViewApp
    
    
    var body: some View {
        VStack{
            TopSection(tittle: "Hidde", subtitle: "out", Background: .orange)
                
            
            Form{
                TextField("name", text: $email)
                    .disableAutocorrection(true).autocapitalization(.none)
                SecureField("wrap your heard", text: $password)
                    .disableAutocorrection(true).autocapitalization(.none)
           
                
                UButton(text: "mena", color: .green){
                    guard !email.isEmpty, !password.isEmpty else {
                       return
                   }
                   viewModel.signUp(email: email, password: password)
                }
            }
        }
    }
}

struct SignIn__Previews: PreviewProvider {
    static var previews: some View {
        SignIn_()
    }
}
