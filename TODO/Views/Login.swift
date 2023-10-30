//
//  Login.swift
//  TODO
//
//  Created by Adel Diaz on 30/09/23.
//

import SwiftUI

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @ObservedObject var viewModel: ModelViewApp
    
    var body: some View {
        VStack{
            TopSection(tittle: "The kill", subtitle: "new", Background: .blue)
                
                Form {
                    
                    TextField("wrap your heard", text: $email) .disableAutocorrection(true).autocapitalization(.none)
                    SecureField("wrap your heard", text: $password)
                        .disableAutocorrection(true).autocapitalization(.none)
                    
                    
                    UButton(text: "mena", color: .blue){
                         guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    } 
                }
            
            VStack{
                Text("Have an account yet?")
                NavigationLink("Create an account", destination: SignIn_())
            }
           
            }
       
        }
  
}

      
    
struct Login_Previews: PreviewProvider {
    static var previews: some View {
            return Login(viewModel: ModelViewApp())
    }
}

