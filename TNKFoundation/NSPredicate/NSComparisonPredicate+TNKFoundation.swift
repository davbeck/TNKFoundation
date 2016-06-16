//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


infix operator %== { precedence 130 }

public func %== (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: NSObject, right: String) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: String, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}

public func %== (left: String, right: String) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .equalTo,
		options: []
	)
}


infix operator %!= { precedence 130 }

public func %!= (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .notEqualTo,
		options: []
	)
}


infix operator %<= { precedence 130 }

public func %<= (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .lessThanOrEqualTo,
		options: []
	)
}


infix operator %< { precedence 130 }

public func %< (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .lessThan,
		options: []
	)
}


infix operator %>= { precedence 130 }

public func %>= (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .greaterThanOrEqualTo,
		options: []
	)
}


infix operator %> { precedence 130 }

public func %> (left: NSObject, right: NSObject) -> Predicate {
	return ComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .direct,
		type: .greaterThan,
		options: []
	)
}


public enum PredicateType {
	case lessThan
	case lessThanOrEqual
	
	case greaterThan
	case greaterThanOrEqual
	
	case equalTo
	case notEqualTo
	
	case matches
	case like
	case beginsWith
	case endsWith
	case `in`
	case contains
	case between
	
	public var NSValue: ComparisonPredicate.Operator {
		switch self {
		case lessThan:
			return .lessThan
		case lessThanOrEqual:
			return .lessThanOrEqualTo
			
		case greaterThan:
			return .greaterThan
		case greaterThanOrEqual:
			return .greaterThanOrEqualTo
			
		case equalTo:
			return .equalTo
		case notEqualTo:
			return .notEqualTo
			
		case matches:
			return .matches
		case like:
			return .like
		case beginsWith:
			return .beginsWith
		case endsWith:
			return .endsWith
		case `in`:
			return .in
		case contains:
			return .contains
		case between:
			return .between
		}
	}
}

extension ComparisonPredicate {
	public convenience init(_ leftExpression: NSObject, _ type: PredicateType, _ rightExpression: NSObject) {
		self.init(
			leftExpression: leftExpression.NSExpressionValue,
			rightExpression: rightExpression.NSExpressionValue,
			modifier: .direct,
			type: type.NSValue,
			options: []
		)
	}
}
