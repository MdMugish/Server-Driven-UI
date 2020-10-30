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
    let status : String
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
            HStack(spacing : 0){
                Text("\(vm.model.pickerHint)\(vm.model.status == "1" ? "*" : "")")

            }.padding(.horizontal, 16)
            
            Picker(selection: $vm.model.selectedValue, label: Text("\(vm.model.pickerHint)\(vm.model.status == "1" ? "*" : "")"), content: {
                ForEach(vm.listOfValues(), id: \.self) { value in
                    Text(value).font(.system(size: 16, weight: .regular, design: .default))
                }
            })
            .pickerStyle(InlinePickerStyle())
            .padding()
            .frame(width: nil, height: 100, alignment: .center).padding(.top,40 ).padding(.bottom,40)
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
        PickerView(vm: PickerViewModel(model: PickerModel(pickerHint: "Gender", pickerValue: "Male, Female", selectedValue: "1", status: "1")))
    }
}
