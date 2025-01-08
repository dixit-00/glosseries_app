//
//  signinView.swift
//  glosseries_app
//
//  Created by student on 07/01/25.
//

import SwiftUI

struct signinView: View {
    @State private var userNumber: String = ""
    
    var body: some View {
        ZStack{
            
            Image("Mask Group")
                .padding(.bottom,-20)
                .ignoresSafeArea()
        }
        Spacer()
        VStack{
            Text("Get your groceries\nwith nectar ")
                .font(.customfont(.bold, fontSize: 30))
                .padding(.trailing, 70.0)
                .padding(.top, 19.0)
                .foregroundColor(.black.opacity(0.8))
            VStack{ TextField("Enter User Number", text: $userNumber)
                    .padding(.leading,35)
                    .keyboardType(.numberPad)
                Divider()
                    .padding()
                    .frame(width: 400)
                   
               
            }
            Spacer()
            
            
            
        }
    }
}

#Preview {
    signinView()
}
