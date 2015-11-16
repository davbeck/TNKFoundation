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
		modifier: .DirectPredicateModifier,
		type: .EqualToPredicateOperatorType,
		options: []
	)
}

public func %== (left: NSObject, right: String) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .EqualToPredicateOperatorType,
		options: []
	)
}

public func %== (left: String, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .EqualToPredicateOperatorType,
		options: []
	)
}


infix operator %!= { precedence 130 }

public func %!= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .NotEqualToPredicateOperatorType,
		options: []
	)
}


infix operator %<= { precedence 130 }

public func %<= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .LessThanOrEqualToPredicateOperatorType,
		options: []
	)
}


infix operator %< { precedence 130 }

public func %< (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .LessThanPredicateOperatorType,
		options: []
	)
}


infix operator %>= { precedence 130 }

public func %>= (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .GreaterThanOrEqualToPredicateOperatorType,
		options: []
	)
}


infix operator %> { precedence 130 }

public func %> (left: NSObject, right: NSObject) -> NSPredicate {
	return NSComparisonPredicate(
		leftExpression: left.NSExpressionValue,
		rightExpression: right.NSExpressionValue,
		modifier: .DirectPredicateModifier,
		type: .GreaterThanPredicateOperatorType,
		options: []
	)
}


public enum PredicateType {
	case LessThan
	case LessThanOrEqual
	
	case GreaterThan
	case GreaterThanOrEqual
	
	case EqualTo
	case NotEqualTo
	
	case Matches
	case Like
	case BeginsWith
	case EndsWith
	case In
	case Contains
	case Between
	
	public var NSValue: NSPredicateOperatorType {
		switch self {
		case LessThan:
			return .LessThanPredicateOperatorType
		case LessThanOrEqual:
			return .LessThanOrEqualToPredicateOperatorType
			
		case GreaterThan:
			return .GreaterThanPredicateOperatorType
		case GreaterThanOrEqual:
			return .GreaterThanOrEqualToPredicateOperatorType
			
		case EqualTo:
			return .EqualToPredicateOperatorType
		case NotEqualTo:
			return .NotEqualToPredicateOperatorType
			
		case Matches:
			return .MatchesPredicateOperatorType
		case Like:
			return .LikePredicateOperatorType
		case BeginsWith:
			return .BeginsWithPredicateOperatorType
		case EndsWith:
			return .EndsWithPredicateOperatorType
		case In:
			return .InPredicateOperatorType
		case Contains:
			return .ContainsPredicateOperatorType
		case Between:
			return .BetweenPredicateOperatorType
		}
	}
}

extension NSComparisonPredicate {
	public convenience init(_ leftExpression: NSObject, _ type: PredicateType, _ rightExpression: NSObject) {
		self.init(
			leftExpression: leftExpression.NSExpressionValue,
			rightExpression: rightExpression.NSExpressionValue,
			modifier: .DirectPredicateModifier,
			type: type.NSValue,
			options: []
		)
	}
}
