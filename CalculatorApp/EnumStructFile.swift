//
//  EnumStructFile.swift
//  CalculatorApp
//
//  Created by shahina kassim on 25/08/2022.
//

import Foundation
enum Operators : String{
    case add = "add"
    case subtract = "minus"
    case multiplication = "multiply"
    case division = "division"
    case nothing = ""
}
enum CalcStates :String{
    case newNum = "newNumber"
    case eneteringNum = "eneteringNumber"
}
