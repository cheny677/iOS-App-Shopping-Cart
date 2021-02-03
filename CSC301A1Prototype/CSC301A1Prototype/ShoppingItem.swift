//
//  ShoppingItem.swift
//  CSC301A1Prototype
//
//  Created by Changhao Song on 2020-09-23.
//

import Foundation
import SwiftUI

public class ShoppingItem {
    // attributes
    var name: String
    var price: Float
    var image: Image
    var numSelected: Int
    
    // initializer
    init(name: String, price: Float, image: String) {
        self.name = name
        self.price = price
        self.image = Image(image)
        self.numSelected = 0
    }
    
    func totalPrice() -> Float {
        return price * Float(numSelected)
    }
    
    func selectNum(num: Int) {
        self.numSelected = num
    }

}
