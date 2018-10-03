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
        if args.contains("count") { // count of numbers
            ret = args.count - 1
        } else if args.contains("avg") { // average of numbers
            for i in args {
                let temp : Int = Int(i) ?? 0
                ret = ret + temp
            }
            if ret != 0 {
                ret = ret / (args.count - 1)
            }
        } else if args.contains("fact") { // factorial
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
    
    // For Floating Point Numbers *EC*
    public func calculateDouble(_ args: [String]) -> Double {
        var ret : Double = 0.0
        if args.contains("count") { // count of numbers
            ret = Double(args.count) - 1.0
        } else if args.contains("avg") { // average of numbers
            for i in args {
                let temp : Double = Double(i) ?? 0.0
                ret = ret + temp
            }
            if ret != 0 {
                ret = ret / (Double(args.count) - 1)
            }
        } else if args.contains("fact") { // factorial
            if args.count == 2 {
                ret = 1.0
                let upper : Int = Int(args[0]) ?? 0
                for i in 1..<(upper + 1){
                    ret = ret * Double(i)
                }
            }
        } else { // traditional calculations
            let left : Double = Double(args[0]) ?? 0.0
            let op = args[1]
            let right : Double = Double(args[2]) ?? 0.0
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
                ret = left.truncatingRemainder(dividingBy: right)
            default:
                print("Operator not valid")
            }
        }
        return ret
    }
    
    // makes String input into [String]
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

// Switches between command line in terminal and in xCode
// depending on if it is run with any additional arguments
if CommandLine.argc > 1 {
    let str = (CommandLine.arguments).joined(separator:" ")
    let withoutAppName = str.replacingOccurrences(of: "main.swift ", with:"")
    print(Calculator().calculate(withoutAppName))
} else {
    print("UW Calculator v1")
    print("Enter an expression separated by returns:")
    let first = readLine()!
    let operation = readLine()!
    let second = readLine()!
    print(Calculator().calculate([first, operation, second]))
}

