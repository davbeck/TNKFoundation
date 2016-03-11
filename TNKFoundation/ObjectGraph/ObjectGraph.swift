//
//  ObjectGraph.swift
//  TNKFoundation
//
//  Created by David Beck on 10/12/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


public struct ObjectGraph {
	public let object: AnyObject?
	
	public init(_ object: AnyObject?) {
		self.object = object
	}
	
	public init() {
		self.object = nil
	}
	
	
	private static let numberFormatter: NSNumberFormatter = {
		let formatter = NSNumberFormatter()
		formatter.numberStyle = .DecimalStyle
		formatter.lenient = false
		
		return formatter
	}()
	
	private static let dateFormatter: NSDateFormatter = {
		let formatter = NSDateFormatter()
		formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
		formatter.timeZone = NSTimeZone(abbreviation: "GMT")
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		
		return formatter
	}()
	
	public var stringValue: String? {
		if let object = object as? String {
			return object
		} else if let object = object as? NSNumber {
			return ObjectGraph.numberFormatter.stringFromNumber(object)
		} else if let object = object as? NSDate {
			return ObjectGraph.dateFormatter.stringFromDate(object)
		} else {
			return nil
		}
	}
	
	public var numberValue: NSNumber? {
		if let object = object as? String {
			return ObjectGraph.numberFormatter.numberFromString(object)
		} else if let object = object as? NSNumber {
			return object
		} else if let object = object as? NSDate {
			return NSNumber(double: object.timeIntervalSince1970)
		} else {
			return nil
		}
	}
	
	public var dateValue: NSDate? {
		if let object = object as? String {
			return ObjectGraph.dateFormatter.dateFromString(object)
		} else if let object = object as? NSNumber {
			return NSDate(timeIntervalSince1970: object.doubleValue)
		} else if let object = object as? NSDate {
			return object
		} else {
			return nil
		}
	}
}

extension ObjectGraph: SequenceType {
	public struct ObjectGraphGenerator: GeneratorType {
		public typealias Element = ObjectGraph
		
		let objectGraph: ObjectGraph
		var index: Int = 0
		
		init(_ objectGraph: ObjectGraph) {
			self.objectGraph = objectGraph
		}
		
		public mutating func next() -> Element? {
			let item = objectGraph[index]
			if item.object == nil {
				return nil
			}
			
			index += 1
			
			return item
		}
	}
	
	public typealias Generator = ObjectGraphGenerator
	
	public func generate() -> Generator {
		return ObjectGraphGenerator(self)
	}
}

extension ObjectGraph : CollectionType {
	public typealias Index = Int
	
	public var startIndex: Int {
		return 0
	}
	
	public var endIndex: Int {
		if let object = object as? NSArray {
			return object.count
		} else if let object = object as? NSDictionary {
			return object.count
		} else {
			return 1
		}
	}
	
	public subscript(index: Int) -> ObjectGraph {
		if let object = object as? NSArray where index < object.count {
			return ObjectGraph(object[index])
		} else if index == 0 {
			return self
		} else {
			return ObjectGraph()
		}
	}
	
	
	public subscript(key: String) -> ObjectGraph {
		get {
			if let object = object as? NSDictionary {
				return ObjectGraph(object[key])
			} else {
				return ObjectGraph()
			}
		}
	}
	
	public var keys: [String] {
		if let object = object as? [String:AnyObject] {
			return Array(object.keys)
		} else {
			return []
		}
	}
	
	public var first: ObjectGraph {
		return self[0]
	}
	
	public var last: ObjectGraph {
		if object is NSArray {
			return self[self.count - 1]
		} else {
			return self
		}
	}
}
