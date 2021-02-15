//
//  DigitAccumulator.swift
//  RPN
//
//  Created by Jeff Kang on 2/14/21.
//

import Foundation

public struct DigitAccumulator {
    public enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    public var digits = [Digit]()
    
    public init() {}
    
    public enum DigitAccumulatorError: Error {
        case extraDecimalPoint
        case invalidDigitNumberValue
    }
    
    public mutating func add(digit: Digit) throws {
        switch digit {
        case .decimalPoint:
            if digits.contains(.decimalPoint) {
                throw DigitAccumulatorError.extraDecimalPoint
            }
        case .number(let value):
            if value < 0 || 9 < value {
                throw DigitAccumulatorError.invalidDigitNumberValue
            }
        }
        digits.append(digit)
    }
    
    public mutating func clear() {
        digits.removeAll()
    }
    
    // [1, 2, ., 3, 4, 5] = 12.345
    
    public func value() -> Double? {
        let string = digits.map { (digit) -> String in
            switch digit {
            case .decimalPoint:
                return "."
            case .number(let value):
                return String(value)
            }
        }.joined()
        return Double(string)
    }
    
}
