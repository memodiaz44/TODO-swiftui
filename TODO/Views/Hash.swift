//
//  Hash.swift
//  TODO
//
//  Created by Adel Diaz on 06/10/23.
//

import SwiftUI

struct Hash: View {
    @ObservedObject var viewModel: ModelViewApp
    
    var body: some View {
        VStack{
            Text("signed in")
            UButton(text: "mena", color: .blue){
                viewModel.signOut()
                
            }
        }
    }
}

struct Hash_Previews: PreviewProvider {
    static var previews: some View {
        Hash(viewModel: ModelViewApp())
    }
}
