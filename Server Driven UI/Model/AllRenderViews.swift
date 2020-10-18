//
//  AllRenderViews.swift
//  Server Driven UI
//
//  Created by mohammad mugish on 18/10/20.
//

import Foundation
struct AllRenderViews : Identifiable{
    let id = UUID()
    let type: UI_ComponentType
    let pickerUIComponent : PickerViewUIComponent?
    let textFieldUIComponent : TextFieldUICompnent?
}
