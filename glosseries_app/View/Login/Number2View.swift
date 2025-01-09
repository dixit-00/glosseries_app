//
//  Number2View.swift
//  glosseries_app
//
//  Created by student on 08/01/25.
//

import SwiftUI

struct Number2View: View {
    var body: some View {
        NavigationView{
            ZStack  {
                Image("Group 6807")
                    .resizable()
                    .padding(.bottom, 570.0)
                    .ignoresSafeArea()
                VStack{
                   
                    Text("Enter your mobile number")
                        .font(.customfont(.semibold, fontSize: 25))
                        .padding(.bottom,20)
                        .padding(.trailing, 42.0)
                    
                     Text("Mobile Number")
                         .font(.customfont(.semibold, fontSize: 15))
                         .foregroundColor(.black.opacity(0.5))
                         .padding(.bottom,600)
                         .padding(.trailing, 231.0)
                    HStack {
                        Button {
                            isShowPicker = true
                        } label: {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.custom("YourCustomFont", size: 35))
                                    .padding(.leading, 25)
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.custom("YourCustomFont", size: 18))
                                    .foregroundColor(.primaryText)
                                Divider()
                            }
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.trailing, 100)
                            .keyboardType(.phonePad)
                        
                     
                        Button(action: {
                            
                            if txtMobile.count == 10 {
                                navigateToNextPage = true
                            } else {
                              
                                print("Invalid mobile number")
                            }
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                                .padding(.trailing, 20)
                        }
                    }
                    Divider()
                        .frame(width: 350)

                    

                    
                    
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
       
    }
}

#Preview {
    Number2View()
}
