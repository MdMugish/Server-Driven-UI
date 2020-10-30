//
//  ListOfForm.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 30/10/20.
//
import Foundation

struct listOfFormModel : Codable, Identifiable
{
    var id: String = UUID().uuidString
    let formTitle : String
    let formSubTitle : String
    let index : String
    
}


struct ListOfFormData :Decodable{
    let data : [String : String]
}


struct ListOfForm : Decodable{
    let allForms : [ListOfFormData]
}


extension ListOfForm {
    
    static func loadJSON(formName : String) -> ListOfForm? {
        
        guard let jsonFilePath = Bundle.main.path(forResource: formName, ofType: "json") else {
            fatalError("Unable to load JSON for \(formName)")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            fatalError("Unable to load data from \(jsonFilePath)")
        }
        
        var form : ListOfForm?
        
        do{
            form =  try JSONDecoder().decode(ListOfForm.self, from: data)
        }catch{
            print(error, "Error")
        }
        
        return form
    }
}
