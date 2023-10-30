//
//  TopSection.swift
//  TODO
//
//  Created by Adel Diaz on 01/10/23.
//

import SwiftUI

struct TopSection: View {
    @State var tittle: String
    @State var subtitle: String
    @State var Background:  Color
    
    
    var body: some View {
       
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Background)
            VStack{
                Text(tittle).foregroundColor(Color.white).bold()
                Text(subtitle).foregroundColor(Color.white)
            }
        }
    }
}

struct TopSection_Previews: PreviewProvider {
    static var previews: some View {
        TopSection(tittle: "faces", subtitle: "swining", Background: .pink)
    }
}
