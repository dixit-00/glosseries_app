//
//  signinView.swift
//  glosseries_app
//
//  Created by student on 07/01/25.
//
import SwiftUI
import CountryPicker

struct SingInView: View {
    
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    // Background Image
                    Image("Mask Group")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .screenWidth, height: .screenWidth)
                    Spacer()
                }
                
                VStack {
                    Image("sign_in_top")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .screenWidth, height: .screenWidth)
                    Spacer()
                }
                
                ScrollView {
                    VStack {
                        Text("Get your groceries \nwith nectar")
                            .font(.custom("YourCustomFont", size: 26))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 350)
                            .padding(.trailing, 130)
                            .padding(.bottom, 20)
                        
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
                        
                        VStack {
                            Text("or connect with social media")
                                .font(.custom("YourCustomFont", size: 16))
                                .foregroundColor(.textTitle)
                                .multilineTextAlignment(.center)
                                .padding(.top, 30)
                                .padding(.bottom, 35)
                            
                            Button {
                               
                            } label: {
                                HStack {
                                    Image("google")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                }
                                Text("Continue with Google")
                                    .font(.custom("YourCustomFont", size: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 40)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .background(Color(hex: "5383EC"))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                            
                            Button {
                               
                            } label: {
                                HStack {
                                    Image("facebook")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                    
                                    Text("Continue with Facebook")
                                        .font(.custom("YourCustomFont", size: 18))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.trailing, 21)
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .background(Color(hex: "4A6680"))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 90)
                }
            }
            .onAppear {
                self.countryObj = Country(phoneCode: "91", isoCode: "IN")
            }
            .sheet(isPresented: $isShowPicker, content: {
                CountryPickerUI(country: $countryObj)
            })
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            // Navigation to next page
            NavigationLink(
                destination:  NextPageView(),
                label: { EmptyView() } 
            )
        }
    }
}

struct NextPageView: View {
    var body: some View {
        VStack {
            Text("You are now on the next page!")
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    SingInView()
}
