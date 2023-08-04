//
//  main.swift
//  OptionalDemo
//
//  Created by KIM Hyung Jun on 2023/08/04.
//

let myOptional: String?

myOptional = "emptyhead"

if let safeOptional = myOptional {
    let text: String = safeOptional
    let text2: String = safeOptional
    print(safeOptional)
} else {
    print("myOptional was found to be nil")
}
