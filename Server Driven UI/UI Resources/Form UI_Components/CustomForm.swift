//
//  FormOne.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation

struct CustomForm : Decodable {
    let type : UI_ComponentType
    let data : [String : String]
}

struct FormComponent : Decodable{
    let pageTitle : String
    let components : [CustomForm]
}

extension FormComponent {
    
    static func loadJSON(formName : String) -> FormComponent? {
        print(formName, "formName is")
        guard let jsonFilePath = Bundle.main.path(forResource: formName, ofType: "json") else {
            fatalError("Unable to load JSON for \(formName)")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            fatalError("Unable to load data from \(jsonFilePath)")
        }
        
        var form : FormComponent?
        
        do{
            form =  try JSONDecoder().decode(FormComponent.self, from: data)
        }catch{
            print(error, "Error")
        }
        
        return form
    }
}
