//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public struct Size : Compound, RelativeCompoundEquality, RelativeCompoundInequality {
    public let context: Context
    public let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        self.context = context
        self.properties = properties
    }
}

// MARK: Multiplication

@discardableResult public func * (m: CGFloat, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

@discardableResult public func * (lhs: Expression<Size>, rhs: CGFloat) -> Expression<Size> {
    return rhs * lhs
}

@discardableResult public func * (m: CGFloat, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m, 0), Coefficients(m, 0) ])
}

@discardableResult public func * (lhs: Size, rhs: CGFloat) -> Expression<Size> {
    return rhs * lhs
}

// MARK: Division

@discardableResult public func / (lhs: Expression<Size>, rhs: CGFloat) -> Expression<Size> {
    return lhs * (1 / rhs)
}

@discardableResult public func / (lhs: Size, rhs: CGFloat) -> Expression<Size> {
    return lhs * (1 / rhs)
}
