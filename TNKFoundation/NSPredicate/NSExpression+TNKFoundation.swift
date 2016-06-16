//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


extension NSObject {
	var NSExpressionValue: NSExpression {
		return NSExpression(forConstantValue: self)
	}
}

extension NSExpression {
	override var NSExpressionValue: NSExpression {
		return self
	}
}


prefix operator % {}
public prefix func % (value: String) -> NSExpression {
	return NSExpression(forKeyPath: value)
}

public prefix func % (value: [String]) -> NSExpression {
	return NSExpression(forKeyPath: value.joined(separator: "."))
}
