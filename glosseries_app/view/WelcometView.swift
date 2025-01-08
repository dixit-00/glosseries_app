//
//  ContentView.swift
//  glosseries_app
//
//  Created by student on 06/01/25.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("8140 1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight)
                
                VStack{
                    Spacer()
                    
                    Image("Group")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.bottom, 8)
                    
                    Text("Welcome\nto our store")
                        .font(.customfont(.semibold, fontSize: 48))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,5)
                    
                    Text("Ger your groceries in as fast as one hour")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.bottom,20)
                    
                    NavigationLink{
                        signinView()
                    } label: {
                        RoundButton(title: "Get Started"){
                        }
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("")
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

