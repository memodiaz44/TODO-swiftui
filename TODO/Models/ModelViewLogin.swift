//
//  ModelViewLogin.swift
//  TODO
//
//  Created by Adel Diaz on 02/10/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class ModelViewApp: ObservableObject {
    
    @Published var session: User?
    @Published var signedin = false
    
    let auth = Auth.auth()
    
   
    
    var isSignedin: Bool {
        return auth.currentUser != nil
    }
    
    
    init() {
        auth.addStateDidChangeListener { [weak self]  (_, user) in
            self?.signedin = user != nil
            if let user = user {
                self?.session = User(Id: user.uid, email: user.email ?? "defaultEmail")
            }else {
                self?.session = nil
            }
        }
    }
    
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {
             [weak self] result, error in
            guard result != nil, error != nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedin = true
            }
        }
        
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {
             [weak self]  result, error in
            guard result != nil, error != nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedin = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
            self.signedin = false
        session = nil 
        
    }
    
}
