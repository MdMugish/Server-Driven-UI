//
//  UI_Templates.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation
import SwiftUI


protocol UIComponent{
    var uniqueId: UUID { get }
    func render() -> AnyView
}

extension UIComponent{
    var uniqueId: UUID { UUID() }
}

enum UI_ComponentType: String, Decodable {
    case textField
    case picker
    
}

