//
//  ObjectGraph.swift
//  TNKFoundation
//
//  Created by David Beck on 10/12/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


public struct ObjectGraph {
	public let object: Any?
	
	public init(_ object: Any?) {
		self.object = object
	}
	
	public init() {
		self.object = nil
	}
	
	
	private static let numberFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.isLenient = false
		
		return formatter
	}()
	
	private static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(abbreviation: "GMT")
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		
		return formatter
	}()
	
	public var stringValue: String? {
		if let object = object as? String {
			return object
		} else if let object = object as? NSNumber {
			return ObjectGraph.numberFormatter.string(from: object)
		} else if let object = object as? Date {
			return ObjectGraph.dateFormatter.string(from: object)
		} else {
			return nil
		}
	}
	
	public var numberValue: NSNumber? {
		if let object = object as? String {
			return ObjectGraph.numberFormatter.number(from: object)
		} else if let object = object as? NSNumber {
			return object
		} else if let object = object as? Date {
			return NSNumber(value: object.timeIntervalSince1970)
		} else {
			return nil
		}
	}
	
	public var dateValue: Date? {
		if let object = object as? String {
			return ObjectGraph.dateFormatter.date(from: object)
		} else if let object = object as? NSNumber {
			return Date(timeIntervalSince1970: object.doubleValue)
		} else if let object = object as? Date {
			return object
		} else {
			return nil
		}
	}
}

extension ObjectGraph: Sequence {
	public struct ObjectGraphGenerator: IteratorProtocol {
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
	
	public typealias Iterator = ObjectGraphGenerator
	
	public func makeIterator() -> Iterator {
		return ObjectGraphGenerator(self)
	}
}

extension ObjectGraph : Collection {
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
	
	public func index(after i: Int) -> Int {
		return i + 1
	}
	
	public subscript(index: Int) -> ObjectGraph {
		if let object = object as? NSArray, index < object.count {
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
		if let object = object as? [String:Any] {
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
