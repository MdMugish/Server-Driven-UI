//
//  FormViewModel.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation

class FormViewModel : ObservableObject{
    
    @Published var textFieldView : [TextFieldUICompnent] = []
    @Published var pickerView : [PickerViewUIComponent] = []
    @Published var allTextFieldValues : [String] = []
    @Published var allPickerValues : [String] = []
    init() {
        print("init", #function)
    }
    
    
    func readTextFieldValue(){
        allTextFieldValues.removeAll()
        self.textFieldView.forEach{ value in
            allTextFieldValues.append(value.vm.model.fieldName)
        }
        
        print(allTextFieldValues, "All Textfields values")
    }
    
    func readpickerValue(){
        self.allPickerValues.removeAll()
        self.pickerView.forEach{ value in
            allPickerValues.append(value.vm.model.selectedValue)
        }
        print(allPickerValues, "All picker values")
    }
    
    
    func loadJSON(typeOfForm : FormType){
        //"FormOne"
        guard let formOneComponent = FormOneComponent.loadJSON(formName: typeOfForm.rawValue) else{
            fatalError("Unable to load the form one")
        }
        
        formOneComponent.components.forEach{ component in
            
            switch component.type {
            
            case .picker :
                guard let pickerModel : PickerModel = component.data.decode() else {
                    return
                }
                DispatchQueue.main.async {
                    self.pickerView.append(PickerViewUIComponent(vm: PickerViewModel(model: pickerModel)))
                }
                
            case .textField :
                
                guard let textFieldModel : TextFieldModel = component.data.decode() else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.textFieldView.append(TextFieldUICompnent(vm: TextFieldViewModel(model: textFieldModel)))
                }
            }
            
        }
        
        
    }
    
}
