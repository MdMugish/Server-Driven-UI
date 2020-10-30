//
//  testing.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 30/10/20.
//

import SwiftUI

struct testing: View {
    
    @StateObject var vm : FormViewModel
    
    @State var presentForm = false
    //    @State var formType : String = FormType.Alpha_1.rawValue
    @Binding var navigateFromInput : Bool
    @State var testing : String = ""
    
    
    var body: some View {
     
        
                
      
            List{
                
                
                VStack(spacing : 20) {
                    ForEach(vm.allViews, id: \.id){ value in
                        
                        if value.pickerUIComponent != nil{
                            value.pickerUIComponent!.render()
                        }else if value.textFieldUIComponent != nil{
                            value.textFieldUIComponent!.render()
                        }
                        
                    }
                }.padding(.top, 30)
                
            
            }.listStyle(GroupedListStyle())

    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing(vm: FormViewModel(formType: FormType.Alpha_1.rawValue), navigateFromInput: .constant(false))
    }
}
