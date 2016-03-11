//
//  NSNumber+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 9/18/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


extension NSNumber {
	@nonobjc public convenience init(_ value: Bool) {
		self.init(bool: value)
	}
	
	@nonobjc public func rawValue() -> Bool {
		return self.boolValue
	}
	
	
	@nonobjc public convenience init(_ value: Float) {
		self.init(float: value)
	}
	
	@nonobjc public func rawValue() -> Float {
		return self.floatValue
	}
	
	
	@nonobjc public convenience init(_ value: Double) {
		self.init(double: value)
	}
	
	@nonobjc public func rawValue() -> Double {
		return self.doubleValue
	}
	
	
	@nonobjc public convenience init(_ value: Int8) {
		self.init(char: value)
	}
	
	@nonobjc public func rawValue() -> Int8 {
		return self.charValue
	}
	
	
	@nonobjc public convenience init(_ value: Int16) {
		self.init(short: value)
	}
	
	@nonobjc public func rawValue() -> Int16 {
		return self.shortValue
	}
	
	
	@nonobjc public convenience init(_ value: Int32) {
		self.init(int: value)
	}
	
	@nonobjc public func rawValue() -> Int32 {
		return self.intValue
	}
	
	
	@nonobjc public convenience init(_ value: Int64) {
		self.init(longLong: value)
	}
	
	@nonobjc public func rawValue() -> Int64 {
		return self.longLongValue
	}
	
	
	@nonobjc public convenience init(_ value: Int) {
		self.init(integer: value)
	}
	
	@nonobjc public func rawValue() -> Int {
		return self.integerValue
	}
	
	
	@nonobjc public convenience init(_ value: UInt8) {
		self.init(unsignedChar: value)
	}
	
	@nonobjc public func rawValue() -> UInt8 {
		return self.unsignedCharValue
	}
	
	
	@nonobjc public convenience init(_ value: UInt16) {
		self.init(unsignedShort: value)
	}
	
	@nonobjc public func rawValue() -> UInt16 {
		return self.unsignedShortValue
	}
	
	
	@nonobjc public convenience init(_ value: UInt32) {
		self.init(unsignedInt: value)
	}
	
	@nonobjc public func rawValue() -> UInt32 {
		return self.unsignedIntValue
	}
	
	
	@nonobjc public convenience init(_ value: UInt64) {
		self.init(unsignedLongLong: value)
	}
	
	@nonobjc public func rawValue() -> UInt64 {
		return self.unsignedLongLongValue
	}
	
	
	@nonobjc public convenience init(_ value: UInt) {
		self.init(unsignedInteger: value)
	}
	
	@nonobjc public func rawValue() -> UInt {
		return self.unsignedIntegerValue
	}
}
