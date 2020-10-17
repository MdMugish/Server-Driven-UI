//
//  UserNameInputView.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 17/10/20.
//

import SwiftUI

struct UserNameInputView: View {
    @State var userNameInput : String = ""
    @State var navigateToForm: Bool = false
    var body: some View {
        
        ZStack {
            
            
            if !navigateToForm{
                VStack(alignment : .leading){
                    Text("Name :")
                    TextField("Enter your name", text: $userNameInput)
                    Button(action : {
                        if userNameInput != ""{
                            navigateToForm = true
                        }
                    }){
                        Text("Start")
                    }
                    Spacer()
                }
                .background(Color.white)
                .padding()
            }
            if navigateToForm && (self.userNameInput.contains("a") || self.userNameInput.contains("A")){
                FormView(formType: .FormOne, navigateFromInput : $navigateToForm )
            }else if navigateToForm && self.userNameInput != ""{
                FormView(formType: .FormTwo, navigateFromInput : $navigateToForm )
            }
           
        }
        
    }
}

struct UserNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserNameInputView()
    }
}
