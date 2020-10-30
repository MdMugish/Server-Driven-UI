//
//  View+Extension.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 16/10/20.
//

import Foundation
import SwiftUI


extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
