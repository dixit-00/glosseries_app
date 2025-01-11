//
//  Number3View.swift
//  glosseries_app
//
//  Created by student on 09/01/25.
//

import SwiftUI

struct Number3View: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
       @StateObject var loginVM = MainViewModel.shared;
   //  @ObservedObject var loginVm = MainViewModel.shared;
    var body: some View {
        NavigationView{
            Image("Rectangle 17")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
                .ignoresSafeArea()
            
            
            
            
        }.navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    Number3View()
}
