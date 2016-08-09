//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


infix operator %== { precedence 130 }

public func %== (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: NSObject, right: String) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: String, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: String, right: String) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}


infix operator %!= { precedence 130 }

public func %!= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .notEqualTo,
		options: []
	)
}


infix operator %<= { precedence 130 }

public func %<= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .lessThanOrEqualTo,
		options: []
	)
}


infix operator %< { precedence 130 }

public func %< (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .lessThan,
		options: []
	)
}


infix operator %>= { precedence 130 }

public func %>= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .greaterThanOrEqualTo,
		options: []
	)
}


infix operator %> { precedence 130 }

public func %> (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .greaterThan,
		options: []
	)
}

extension NSComparisonPredicate {
	public convenience init(_ leftExpression: NSObject, _ type: Operator, _ rightExpression: NSObject) {
		self.init(
			leftExpression: leftExpression.NSExpressionValue,
			rightExpression: rightExpression.NSExpressionValue,
			modifier: .direct,
			type: type,
			options: []
		)
	}
}
