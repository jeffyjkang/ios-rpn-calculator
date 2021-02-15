//
//  Stack.swift
//  RPN
//
//  Created by Jeff Kang on 2/14/21.
//

// Access Control
// Public - Available across project and framework (Something in RPN will be available to Calculator)
// Internal - Default Access, only available within its own project or framework
// Fileprivate (Rarely use)
// Private - Only available in the class in which it was created

import Foundation

struct Stack<T> : ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    
    private(set) var items: [T]
    
    init(arrayLiteral elements: ArrayLiteralElement...) {
        items = elements
    }
    
    mutating func push(_ value: T) {
        items.append(value)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    // see the top thing on the stack without removing
    func peek() -> T? {
        return items.last
    }
}
