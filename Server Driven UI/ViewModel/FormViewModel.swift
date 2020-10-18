//
//  FormViewModel.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation



class FormViewModel : ObservableObject{
    


    
    @Published var allViews = [AllRenderViews]()
    @Published var allValues : [String] = []
    
    init() {
        print("init", #function)
    }
    
    func readAllValues(){
        
        allValues.removeAll()
        
        self.allViews.forEach{ value in
            if value.type == .picker{
                
                print("Value of Picker is : ", value.pickerUIComponent!.vm.model.selectedValue)
                
                self.allValues.append(value.pickerUIComponent!.vm.model.selectedValue)
                
            }else if value.type == .textField{
                print("Value of text field is : ", value.textFieldUIComponent!.vm.model.fieldName)
                
                self.allValues.append(value.textFieldUIComponent!.vm.model.fieldName)
            }
        }

        
        
        
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
           
                    self.allViews.append(AllRenderViews(type: .picker, pickerUIComponent: PickerViewUIComponent(vm: PickerViewModel(model: pickerModel)), textFieldUIComponent: nil))
      
                }
                
            case .textField :
                
                guard let textFieldModel : TextFieldModel = component.data.decode() else {
                    return
                }
                
                DispatchQueue.main.async {

                    
                    self.allViews.append(AllRenderViews(type: .textField, pickerUIComponent: nil, textFieldUIComponent: TextFieldUICompnent(vm: TextFieldViewModel(model: textFieldModel))))
                   
                }
            }
            
        }
        
        
    }
    
}
