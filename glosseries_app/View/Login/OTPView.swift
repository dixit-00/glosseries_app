//
//  Number2View.swift
//  glosseries_app
//
//  Created by student on 08/01/25.
//

import SwiftUI

struct OTPView: View {
    @State private var otpCode = "" // The OTP code entered by the user
    let otpLength = 4 // The length of the OTP
    @State private var navigateToNextPage = false // Flag to trigger navigation
    @State private var isResendEnabled = true // Flag to enable/disable resend button
    @State private var resendTimer = 30 // Timer countdown in seconds
    @State private var timer: Timer? // Timer instance for the countdown
    @State private var otp = ["", "", "", ""]
       @FocusState private var focusedField: Int?

    var body: some View {
        NavigationView {
            ZStack {
                Image("Group 6807")
                    .resizable()
                    .padding(.bottom, 550)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        // OTP Input Prompt
                        VStack {
                            Text("Enter the 4-digit OTP")
                                .font(.custom("semibold", size: 30))
                                .padding(.trailing, 40)
                                .padding(.top, 60)

                            Text("Code")
                                .font(.custom("semibold", size: 17))
                                .padding(.trailing, 280)
                                .padding(.top,-5)
                                .foregroundColor(.black.opacity(0.6))

                        }
                        // OTP Fields (minimalist design)
                        HStack(spacing: 10) {
                            ForEach(0..<otpLength, id: \.self) { index in
                                OTPTextField(otpCode: $otpCode, index: index)
                                    .frame(width: 40, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.title)
                                    .background(Color.white) // Background color for text field
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                    .keyboardType(.phonePad)
                            }
                        }
                        .padding(.trailing, 130)
                        .padding()
                        
                        Divider()
                            .padding(.top, 5)
                        
                        // Resend OTP Timer and Button
                        HStack {
                            Button(action: resendOtp) {
                                Text(isResendEnabled ? "Resend OTP" : "Resend in \(resendTimer) sec")
                                    .font(.customfont(.semibold, fontSize: 20))
                                    .foregroundColor(isResendEnabled ? .green : .gray)
                                    .padding()
                                    .background(isResendEnabled ? Color.white : Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                            .disabled(!isResendEnabled) // Disable if resend is not enabled
                            .padding(.trailing,125)
                     
                        
                        // Verify OTP Button
                        Button(action: verifyOtp) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.custom("semibold", size: 50))
                                .foregroundColor(.green)
                                .background(Color.white)
                                .cornerRadius(25)
                        }
                       
                        }
                        .padding(.top, 120)
                        
                        HStack{
                            Image("Group 6807")
                                .resizable()
                                .frame(width: .screenWidth, height: 300)
                                .padding(.top,70)
                                
                             
                       
                        }
                        .padding(.top,20)
 
                        
                        // NavigationLink to NextPageView when otpCode is valid
                        NavigationLink(destination: NextPageView(), isActive: $navigateToNextPage) {
                            EmptyView()
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    private func resendOtp() {
        // Reset the OTP input field when resending OTP
        otpCode = ""
        
        // Start a countdown for the resend timer
        isResendEnabled = false
        resendTimer = 30
        
        // Start the countdown timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.resendTimer > 0 {
                self.resendTimer -= 1
            } else {
                // Enable the button once the timer reaches 0
                self.isResendEnabled = true
                timer.invalidate()
            }
        }
        
        // Simulate sending OTP again
        print("Resending OTP...")
        // You can also integrate actual OTP resend logic here.
    }

    private func verifyOtp() {
        // Simulate OTP verification (replace with your actual validation logic)
        if otpCode == "1234" {
            print("OTP verified successfully!")
            navigateToNextPage = true // Trigger navigation to the next page
        } else {
            print("Invalid OTP")
        }
    }
}

struct OTPTextField: View {
    @Binding var otpCode: String
    let index: Int
    
    var body: some View {
        VStack {
            TextField("", text: Binding(
                get: {
                    // Get the specific character at the given index in otpCode
                    let character = otpCode.count > index ? String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: index)]) : ""
                    return character
                },
                set: { newValue in
                    // Update otpCode when the user enters a character
                    if newValue.count == 1 {
                        var newOtp = otpCode
                        let indexToUpdate = otpCode.index(otpCode.startIndex, offsetBy: index)
                        newOtp.replaceSubrange(indexToUpdate...indexToUpdate, with: newValue)
                        otpCode = newOtp
                    }
                }
            ))
            .keyboardType(.numberPad) // Set keyboard type to number pad
            .font(.title) // Larger text to make it more readable
            .frame(width: 50, height: 60) // Control the size of each OTP box
            .background(Color.white) // Background color for the text field
            .cornerRadius(8) // Rounded corners for each OTP box
            .padding(.horizontal, 5)
            
            Divider()
                .background(Color.black.opacity(0.5)) // Divider color
                .frame(height: 2)
                .padding(.top, 5)
        }
        
    }
}

struct nextPageView: View {
    var body: some View {
        VStack {
            Text("You are now on the next page!")
                .font(.title)
                .padding()
        }
    }
}

// Correct PreviewProvider for ContentView or OTPView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView() // Preview the OTPView here
    }
}

