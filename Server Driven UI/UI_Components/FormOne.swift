//
//  FormOne.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation

struct FormOne : Decodable {
    let type : UI_ComponentType
    let data : [String : String]
}

struct FormOneComponent : Decodable{
    let pageTitle : String
    let components : [FormOne]
}

extension FormOneComponent {
    
    static func loadJSON(formName : String) -> FormOneComponent? {
        
        guard let jsonFilePath = Bundle.main.path(forResource: formName, ofType: "json") else {
            fatalError("Unable to load JSON for \(formName)")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            fatalError("Unable to load data from \(jsonFilePath)")
        }
        
        var form : FormOneComponent?
        
        do{
            form =  try JSONDecoder().decode(FormOneComponent.self, from: data)
        }catch{
            print(error, "Error")
        }
        
        return form
    }
}
