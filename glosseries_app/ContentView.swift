//
//  ContentView.swift
//  glosseries_app
//
//  Created by student on 06/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongusername = 0
    @State private var wrongpassword = 0
    @State private var showloginpage = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("8140 1")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("Group")
                        .padding(.top,200)
                    
                    
                    Text("Welcome")
                        .font(.system(size: 50))
                        .multilineTextAlignment(.leading)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("to our store")
                    
                        .font(.system(size: 50))
                        .multilineTextAlignment(.leading)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        
                    
                    
//                    Text("Ger your groceries in as fast as one hour")
//                        .padding(.top,-30)
//                        .foregroundColor(.white.opacity(0.7))
                        
                        
                  
                   
                    HStack {
                        
                        
                        Button("GET START") {
                            NavigationLink(destination: Text("You are logged in as \(username)")) {
                                EmptyView()
                                
                                
                            }
                            
                        }
                            .font(.headline)
                            .frame(width: 300 ,height: 20)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding()
                    .background(Color.green.opacity(0.9))
                    .cornerRadius(14)
                    .shadow(radius: 5)
                    .frame(height: 50)
                    .onTapGesture {
                      
                        authenticateUser(username: "googleUser", password: "googlePass")
                    }
                    .padding()
                   
                  
                    
                   
                }
                .padding(.bottom,-200)
            }
        }
        .navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String) {
        if username == "dixit" {
            if password == "abc@123" {
             
                showloginpage = true
            } else {
             
                wrongpassword = 0
                print("Wrong password!")
            }
        } else {
           
            wrongusername = 0
            print("Wrong username!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

