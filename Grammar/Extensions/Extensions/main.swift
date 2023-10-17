//
//  main.swift
//  Extensions
//
//  Created by KIM Hyung Jun on 2023/08/07.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

var myDouble = 3.14159

myDouble.round(to: 3)

