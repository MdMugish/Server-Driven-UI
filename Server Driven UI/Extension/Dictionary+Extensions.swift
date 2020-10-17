//
//  Dictionary+Extensions.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation

extension Dictionary {
    
    func decode<T: Codable>() -> T? {
        
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
}
