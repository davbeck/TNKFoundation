//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


private func asExpression(_ value: Any) -> NSExpression {
	if let expression = value as? NSExpression {
		return expression
	} else {
		return NSExpression(forConstantValue: value)
	}
}


infix operator %==: ComparisonPrecedence

public func %== (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}


infix operator %!=: ComparisonPrecedence

public func %!= (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .notEqualTo,
		options: []
	)
}


infix operator %<=: ComparisonPrecedence

public func %<= (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .lessThanOrEqualTo,
		options: []
	)
}


infix operator %<: ComparisonPrecedence

public func %< (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .lessThan,
		options: []
	)
}


infix operator %>=: ComparisonPrecedence

public func %>= (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .greaterThanOrEqualTo,
		options: []
	)
}


infix operator %>: ComparisonPrecedence

public func %> (left: Any, right: Any) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: asExpression(left),
		rightExpression: asExpression(right),
		modifier: .direct,
		type: .greaterThan,
		options: []
	)
}

extension NSComparisonPredicate {
	public convenience init(_ left: Any, _ type: Operator, _ right: Any) {
		self.init(
			leftExpression: asExpression(left),
			rightExpression: asExpression(right),
			modifier: .direct,
			type: type,
			options: []
		)
	}
}
