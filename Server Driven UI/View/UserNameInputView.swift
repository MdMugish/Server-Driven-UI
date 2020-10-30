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
    @StateObject var listOfFormVM = ListOfFormsViewModel()
    
//    @State var allForm : [FormType] = [.Alpha_1, .Alpha_2]
    var body: some View {
        
        

        NavigationView {
            ZStack {
                List{
                        ForEach(listOfFormVM.listOfForm, id: \.id){ value in
                            
                            NavigationLink(value.formTitle, destination: FormView(vm: FormViewModel(formType: value.formTitle), navigateFromInput: $navigateToForm).navigationBarTitle("\(value.formTitle)", displayMode: .inline))
                        }
                        
                }.listStyle(InsetGroupedListStyle())
                
                
                VStack{
                    Spacer()
                    VStack{
                        HStack{
                            Text("\(listOfFormVM.listOfForm.count) Forms")
                                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            Spacer()
                        }
                        
                    }
                    .padding()
                    .background(Color.black.opacity(0.1))
                   
                }
                
                
                .navigationTitle("Form")
            }
        }
        
        
        
            

    }
}

struct UserNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserNameInputView()
    }
}

struct ExtractedView: View {
    @StateObject var listOfFormVM = ListOfFormsViewModel()
    var body: some View {
        List{
            ForEach(listOfFormVM.listOfForm, id: \.id){ value in
                Text("\(value.formTitle)")
    
            }
        }.onAppear(perform: {
            listOfFormVM.loadJSON()
        })
    }
}
