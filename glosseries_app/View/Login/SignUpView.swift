//
//  SignInView.swift
//  glosseries_app
//
//  Created by student on 11/01/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared
   
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("bottom_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // App Logo
                        Image("Group (3)")
                            .resizable()
                            .frame(width: 50, height: 60)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        // Sign Up Heading
                        Text("Sign up")
                            .font(.customfont(.semibold, fontSize: 30))
                            .padding(.leading, 16)
                        
                        // Description
                        Text("Enter your email and password")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .padding(.leading, 16)
                            .padding(.bottom, 30)
                        
                        // Username Field
                        LineTextField(
                            title: "Username",
                            placholder: "Enter your Username",
                            txt: $loginVM.txtUsername,
                            keyboardType: .namePhonePad
                        )
                        .padding(.horizontal, 16)
                        .padding(.bottom, 20)
                        
                        // Email Field
                        LineTextField(
                            title: "Email",
                            placholder: "Enter your email address",
                            txt: $loginVM.txtEmail,
                            keyboardType: .emailAddress
                        )
                        .padding(.horizontal, 16)
                        .padding(.bottom, 20)
                        
                        // Password Field
                        LineSecureField(
                            title: "Password",
                            placholder: "Enter your password",
                            txt: $loginVM.txtPassword,
                            isShowPassword: $loginVM.isShowPassword
                        )
                        .padding(.horizontal, 16)
                        
                        // Forgot Password Button
                       
                        }
                    }
                    .padding(.top, 50)
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }


// Forgot Password View

#Preview {
    SignUpView()
}
