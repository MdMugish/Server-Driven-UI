//
//  TextField.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation
import SwiftUI
import Combine

struct TextFieldModel : Codable{
    let fieldHint : String
    var fieldName : String
    var status : String
    let minValue : String
    let maxValue  : String
    let inputType : String
    let validation_status : String
    let validation_URL : String
    
}


class TextFieldViewModel : ObservableObject{
    @Published var model : TextFieldModel
    
    init(model : TextFieldModel){
        self.model = model
    }
    
    
    
}

struct TextFieldView : View{
    
    @ObservedObject var vm : TextFieldViewModel
    @State var validDataLength : Bool = false
    var body : some View{
        
        VStack(alignment : .leading){
            

                Text("\(vm.model.fieldHint)\(vm.model.status == "1" ? "*" : "")")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .opacity(0.6)
//
//


            TextField(vm.model.fieldHint, text: $vm.model.fieldName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(
                    vm.model.inputType == KeyboardInputType.text.rawValue ? .alphabet : vm.model.inputType == KeyboardInputType.number.rawValue ? .numberPad : .emailAddress
                )
                .foregroundColor(validDataLength ? Color(#colorLiteral(red: 0.1334922638, green: 0.2985338713, blue: 0.1076392498, alpha: 1)) : .black)
                .font(.system(size: 16, weight: .regular, design: .default))
                .frame(height: 40)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.leading, .trailing], 8)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
//                    .padding([.leading, .trailing], 24)
            .onReceive(Just(vm.model.fieldName)) { _ in
                
                    //MARK: Maximim lenght boundry check
                    if vm.model.fieldName.count > Int(vm.model.maxValue)!{
                        print("Boundry cross Now")
                        vm.model.fieldName = String(vm.model.fieldName.prefix(Int(vm.model.maxValue)!))
                    }
                    
                    //MARK: Min Lenght Validation failed
                    else if (vm.model.fieldName.count < Int(vm.model.minValue)!){
                        validDataLength = false
                        print("Please enter more then \(vm.model.minValue) char.")
                        
                    }
                    
                    //MARK: Min Lenght Validation Success
                    else if vm.model.fieldName.count >= Int(vm.model.minValue)!{
                        print("Cross min required data")
                        
                        if vm.model.inputType == KeyboardInputType.email.rawValue{
                            //MARK: Email Validation
                            if vm.model.fieldName.contains("@") && vm.model.fieldName.contains("."){
                                validDataLength = true
                            }else{
                                validDataLength = false
                            }
                        }else{
                            validDataLength = true
                        }
                       
                    }
                }
         

        }
        .padding()
    }
}


struct TextFieldUICompnent : UIComponent {
   
    @ObservedObject var vm : TextFieldViewModel
    
    func render() -> AnyView {
        TextFieldView(vm: vm).toAnyView()
    }
    
}


//struct TextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldView(vm: TextFieldViewModel(model: TextFieldModel(fieldHint: "Enter your name", fieldName: "")))
//    }
//}
