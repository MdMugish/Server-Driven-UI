//
//  TextField.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation
import SwiftUI


struct TextFieldModel : Codable{
    let fieldHint : String
    var fieldName : String
}


class TextFieldViewModel : ObservableObject{
    @Published var model : TextFieldModel
    
    init(model : TextFieldModel){
        self.model = model
        
        print(#function, "Init")
    }
    
}

struct TextFieldView : View{
    
    @ObservedObject var vm : TextFieldViewModel
    
    var body : some View{
        VStack{
            TextField(vm.model.fieldHint, text: $vm.model.fieldName)
        }.padding()
    }
}


struct TextFieldUICompnent : UIComponent {
   
    @ObservedObject var vm : TextFieldViewModel
    
    func render() -> AnyView {
        TextFieldView(vm: vm).toAnyView()
    }
    
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(vm: TextFieldViewModel(model: TextFieldModel(fieldHint: "Enter your name", fieldName: "")))
    }
}
