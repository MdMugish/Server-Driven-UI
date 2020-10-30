//
//  ContentView.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import SwiftUI
import Combine


struct FormView: View {
    
    @StateObject var vm : FormViewModel
    
    @State var presentForm = false
    @Binding var navigateFromInput : Bool
    
    
    var body: some View {
        
        ScrollView {
            ZStack{
        
                
                VStack{
                    
                    
                    ForEach(vm.allViews, id: \.id){ value in
                        if value.pickerUIComponent != nil{
                            value.pickerUIComponent!.render()
                        }else if value.textFieldUIComponent != nil{
                            value.textFieldUIComponent!.render()
                        }
                    }
                    
                    
                    Spacer()
                    
                    Button(action : {
                        hideKeyboard()
                        vm.readAllValues()
                        presentForm.toggle()
                        
                    }){
                        Text("Sumbit")
                    }
                    .padding()
                    
  
                }.background(Color.clear)
                
                if presentForm {
                    
                    HStack{
                        Spacer()
                    }
                    
                    VStack(alignment : .leading, spacing : 12){
                        ForEach(0..<vm.allViews.count){ value in
                            
                            if vm.allViews[value].textFieldUIComponent != nil{
                                Text("\(vm.allViews[value].textFieldUIComponent!.vm.model.fieldHint) :   \(vm.allValues[value])")
                            }else if vm.allViews[value].pickerUIComponent != nil{
                                Text("\(vm.allViews[value].pickerUIComponent!.vm.model.pickerHint) :   \(vm.allValues[value])")
                            }
                            
                            
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
                    .padding(.top, 70)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .background(Color.white)
                    
                    
                }
                
                
            }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                hideKeyboard()
            })
        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            hideKeyboard()
        })
    }
}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView(navigateFromInput: .constant(false))
//    }
//}
