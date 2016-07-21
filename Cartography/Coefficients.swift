//
//  Coefficients.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct Coefficients {
    var multiplier: CGFloat = 1
    var constant: CGFloat = 0

    init() { }

    init(_ multiplier: CGFloat, _ constant: CGFloat) {
        self.constant = constant
        self.multiplier = multiplier
    }
}

// MARK: Addition

@discardableResult public func + (c: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant + c)
}

@discardableResult public func + (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs + lhs
}

// MARK: Subtraction

@discardableResult public func - (c: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant - c)
}

@discardableResult public func - (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs - lhs
}

// MARK: Multiplication

@discardableResult public func * (m: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier * m, rhs.constant * m)
}

@discardableResult public func * (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs * lhs
}

// MARK: Division

@discardableResult public func / (m: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier / m, rhs.constant / m)
}

@discardableResult public func / (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs / lhs
}
