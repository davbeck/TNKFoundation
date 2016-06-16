//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


public func && (left: Predicate, right: Predicate) -> Predicate {
	return CompoundPredicate(type: .and, subpredicates: [left, right])
}

public func || (left: Predicate, right: Predicate) -> Predicate {
	return CompoundPredicate(type: .or, subpredicates: [left, right])
}

public prefix func ! (predicate: Predicate) -> Predicate {
	return CompoundPredicate(type: .not, subpredicates: [predicate])
}
