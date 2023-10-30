//
//  Button.swift
//  TODO
//
//  Created by Adel Diaz on 01/10/23.
//

import SwiftUI

struct UButton: View {
    @State var text: String
    @State var color: Color
    @State var action: () -> Void
    
    
    var body: some View {
        Button  {
            action()
        }  label:  {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color)
                    .frame(width: 180, height: 50)
                Text(text)
                    .foregroundColor(Color.white)
            }
        }
    }
    
    struct Button_Previews: PreviewProvider {
        static var previews: some View {
            UButton(text: "waify", color: .green){
                // action
            }
        }
    }
}
