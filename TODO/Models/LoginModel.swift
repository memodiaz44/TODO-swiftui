//
//  LoginModel.swift
//  TODO
//
//  Created by Adel Diaz on 01/10/23.
//
import FirebaseAuth
import Foundation

class LoginModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init(){}
    
    func Login (){
       
        Auth.auth().signIn(withEmail: email, password: password )
    }
    
    private func validate(){
        error = ""
        guard !email.isEmpty , password.isEmpty else {
            error = "filds are required "
            return
        }
    }

}
