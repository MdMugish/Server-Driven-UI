//
//  ListOfFormsViewModel.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 30/10/20.
//

import Foundation

class ListOfFormsViewModel : ObservableObject{
    
    @Published var listOfForm = [listOfFormModel]()
    
    init() {
        print("init ListOfFormViewModel", #function)
            loadJSON()
        
    }
    
    
    func loadJSON(){
        
        guard let allForms =  ListOfForm.loadJSON(formName: "allForms") else{
            fatalError("Unable to load the form one")
        }
        
        
        allForms.allForms.forEach{ value in
        
            guard let myData : listOfFormModel =  value.data.decode() else {
                print("error while decoding")
                return
            }
            
            print(myData, "This is my real data")
            listOfForm.append(myData)
//            print(myData["formSubTitle"]!, "FormSubtitle")
//            print(myData["formTitle"]!, "formTitle")
//            print(myData["index"]!, "index")
//            print(myData, "This is my data")
//
//            listOfForm.updateValue(myData["formSubTitle"]!, forKey: myData["formTitle"]!)
//
            print(listOfForm, "LIst of form")
            
        }
        
        
        
    }
    
    
    func dicSort(){
      
    }
    
}
