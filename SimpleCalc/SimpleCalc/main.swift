//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var ret : Int = 0
        
        if args.contains("count") {
            ret = args.count - 1
        } else if args.contains("avg") {
            for i in args {
                let temp : Int = Int(i) ?? 0
                ret = ret + temp
            }
            if ret != 0 {
                ret = ret / (args.count - 1)
            }
        } else if args.contains("fact") {
            if args.count == 2 {
                ret = 1
                let upper : Int = Int(args[0]) ?? 0
                for i in 1..<(upper + 1){
                    ret = ret * i
                }
            }
        } else { // traditional calculations
            let left : Int = Int(args[0]) ?? 0
            let op = args[1]
            let right : Int = Int(args[2]) ?? 0
            switch op {
            case "+":
                ret = left + right
            case "-":
                ret = left - right
            case "/":
                ret = left / right
            case "*":
                ret = left * right
            case "%":
                ret = left % right
            default:
                print("Operator not valid")
            }
        }
        return ret
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

