//
//  Calculator.swift
//  RPN
//
//  Created by Jeff Kang on 2/14/21.
//

import Foundation

public struct Calculator {
    public enum Operator {
        case add, subtract, multiply, divide
    }
    
    private var stack: Stack<Double> = [0.0, 0.0]
    
    public var topValue: Double? {
        return stack.peek()
    }
    
    public init() {}
        
    public mutating func push(number: Double) {
        stack.push(number)
    }
    
    public mutating func push(operator: Operator) {
        let operand2 = stack.pop() ?? 0.0
        let operand1 = stack.pop() ?? 0.0
        
        let result: Double
        switch `operator` {
        case .add:
            result = operand1 + operand2
        case .subtract:
            result = operand1 - operand2
        case .multiply:
            result = operand1 * operand2
        case .divide:
            result = operand1 / operand2
        }
        stack.push(result)
    }
    
    public mutating func clearStack() {
        stack = []
    }
    
}
