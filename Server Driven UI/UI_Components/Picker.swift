//
//  Picker.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation
import SwiftUI




struct PickerModel : Codable{
    let pickerHint : String
    var pickerValue : String
    var selectedValue : String
}



class PickerViewModel : ObservableObject{
    @Published var model : PickerModel
    
    
    func listOfValues() -> [String]{
        return model.pickerValue.components(separatedBy: ",")
    }
    
    init(model : PickerModel){
        self.model = model
    }
}


struct PickerView : View {
    
    @ObservedObject var vm : PickerViewModel
    @State var select : Int = 0
    var body : some View{
        VStack(alignment : .leading) {
            Text("\(vm.model.pickerHint)").padding(.horizontal, 16)
            
            Picker(selection: $vm.model.selectedValue, label: Text("Gender"), content: {
                ForEach(vm.listOfValues(), id: \.self) { value in
                    Text(value)
                }
            }).pickerStyle(InlinePickerStyle()).padding().frame(width: nil, height: 100, alignment: .center)
        }
    }
}


struct PickerViewUIComponent : UIComponent {
    
    @ObservedObject var vm : PickerViewModel
    
    func render() -> AnyView {
        PickerView(vm: vm).toAnyView()
    }
 
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(vm: PickerViewModel(model: PickerModel(pickerHint: "Gender", pickerValue: "Male, Female", selectedValue: "1")))
    }
}
