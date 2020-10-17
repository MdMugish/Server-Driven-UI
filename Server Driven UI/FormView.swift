//
//  ContentView.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import SwiftUI


struct FormView: View {
    
    @StateObject private var vm : FormViewModel = FormViewModel()
    @State var presentForm = false
    @State var formType : FormType = .FormOne
    @Binding var navigateFromInput : Bool
    var body: some View {
        
        ZStack{
            
            
            VStack{
                HStack{
                    Button(action : {
                        navigateFromInput = false
                    }){
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top,24)
                ForEach(vm.textFieldView, id: \.uniqueId){ textFieldComponent in
                    textFieldComponent.render()
                }
                
                ForEach(vm.pickerView, id: \.uniqueId){ pickerViewComponent in
                    pickerViewComponent.render()
                }
                
                Spacer()
                Button(action : { vm.readTextFieldValue()
                    vm.readpickerValue()
                    presentForm.toggle()
                }){
                    Text("Sumbit")
                }.padding()
            }
            
            if presentForm {
                
                HStack{
                    Spacer()
                }
                VStack(alignment : .leading, spacing : 12){
                    ForEach(0..<vm.textFieldView.count){ value in
                        Text("\(vm.textFieldView[value].vm.model.fieldHint) :   \(vm.allTextFieldValues[value])")
                    }
                    
                    ForEach(0..<vm.pickerView.count){ value in
                        
                        Text("\(vm.pickerView[value].vm.model.pickerHint) :   \(vm.allPickerValues[value] )")
                        
                    }
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action : {
                            presentForm.toggle()
                        }){
                            Text("Cancel")
                        }.padding()
                        Spacer()
                    }
                    
                }
                .padding(32)
                .padding(.top, 32)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .background(Color.white)
                
                
            }
            
            
        }.onAppear(perform: {
            vm.loadJSON(typeOfForm: formType)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(navigateFromInput: .constant(false))
    }
}
