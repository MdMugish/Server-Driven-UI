//
//  FormTwo.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 17/10/20.
//

import Foundation

struct FormTwo : Decodable {
    let type : UI_ComponentType
    let data : [String : String]
}

struct FormTwoComponent : Decodable{
    let pageTitle : String
    let components : [FormTwo]
}

extension FormTwoComponent {
    
    static func loadJSON(formName : String) -> FormTwoComponent? {
        
        guard let jsonFilePath = Bundle.main.path(forResource: formName, ofType: "json") else {
            fatalError("Unable to load JSON for \(formName)")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            fatalError("Unable to load data from \(jsonFilePath)")
        }
        
        var form : FormTwoComponent?
        
        do{
            form =  try JSONDecoder().decode(FormTwoComponent.self, from: data)
        }catch{
            print(error, "Error")
        }
        
        return form
    }
}
