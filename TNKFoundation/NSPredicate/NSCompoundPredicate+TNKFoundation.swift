//
//  NSPredicate+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/29/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


public func && (left: NSPredicate, right: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate(type: .and, subpredicates: [left, right])
}

public func || (left: NSPredicate, right: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate(type: .or, subpredicates: [left, right])
}

public prefix func ! (predicate: NSPredicate) -> NSPredicate {
	return NSCompoundPredicate(type: .not, subpredicates: [predicate])
}
