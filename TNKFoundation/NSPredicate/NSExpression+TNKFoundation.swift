//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


precedencegroup KeyPathPrecedence {
	higherThan: ComparisonPrecedence
}


prefix operator %

public prefix func % (value: String) -> NSExpression {
	return NSExpression(forKeyPath: value)
}

public prefix func % (value: [String]) -> NSExpression {
	return NSExpression(forKeyPath: value.joined(separator: "."))
}
