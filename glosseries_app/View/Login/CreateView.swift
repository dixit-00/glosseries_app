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
                            
                            NavigationLink(
                                destination: OTPView(),  // The destination view
                                isActive: $navigateToNextPage, // Binding to trigger navigation
                                label: { EmptyView() } // Empty view because you don't want a visible link
                            )
                        }
                            Button {
                                
                            } label: {
                                HStack {
                                    //                         Image("communication.png")
                                    //                                    .resizable()
                                    //                                    .scaledToFit()
                                    //                                    .frame(width: 20, height: 20)
                                    //                                    .padding(.trailing, 20)
                                }
                                Text("SignIn with Email")
                                    .font(.custom("YourCustomFont", size: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .background(Color(hex: "5383EC"))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    //                                Image("facebook")
                                    //                                    .resizable()
                                    //                                    .scaledToFit()
                                    //                                    .frame(width: 20, height: 20)
                                    //                                    .padding(.trailing, 20)
                                    
                                    Text("SignUp With Email")
                                        .font(.custom("YourCustomFont", size: 18))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .background(Color(hex: "4A6680"))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            
                            Divider()
                                .frame(width: 350)
                            
                            VStack {
                                Text("or connect with social media")
                                    .font(.custom("YourCustomFont", size: 16))
                                    .foregroundColor(.textTitle)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 30)
                                    .padding(.bottom, 35)
                                HStack(spacing: 20) {  // Added spacing between the images
                                    Image("google (2)")
                                        .resizable()
                                        .scaledToFit()  // Maintain aspect ratio
                                        .frame(width: 40, height: 40)
                                    
                                    Image("facebook (1)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    Image("apple")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.top, -30) // Applied top padding to the whole stack, instead of individual images
                                
                                
                                
                            }
                        }
                        .padding(.top, 30)
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
