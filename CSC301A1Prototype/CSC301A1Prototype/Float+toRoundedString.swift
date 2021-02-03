//
//  Float+toRoundedString.swift
//  CSC301A1Prototype
//
//  Created by Changhao Song on 2020-09-23.
//

import Foundation

extension Float {
    func toRoundedString() -> String {
        return String(format: "%.2f", self)
    }
}
