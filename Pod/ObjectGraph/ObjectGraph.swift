//
//  ObjectGraph.swift
//  TNKFoundation
//
//  Created by David Beck on 10/12/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


struct ObjectGraph {
	let object: AnyObject?
	
	init(_ object: AnyObject?) {
		self.object = object
	}
	
	init() {
		self.object = nil
	}
}

extension ObjectGraph: SequenceType {
	class ObjectGraphGenerator: AnyGenerator<ObjectGraph> {
		let objectGraph: ObjectGraph
		var index: Int = 0
		
		init(_ objectGraph: ObjectGraph) {
			self.objectGraph = objectGraph
		}
	}
	
	typealias Generator = ObjectGraphGenerator
	
	func generate() -> Generator {
		return ObjectGraphGenerator(self)
	}
}

extension ObjectGraph : CollectionType {
	typealias Index = Int
	
	var startIndex: Int {
		return 0
	}
	
	var endIndex: Int {
		if let object = object as? NSArray {
			return object.count
		} else if let object = object as? NSDictionary {
			return object.count
		} else {
			return 0
		}
	}
	
	subscript(index: Int) -> ObjectGraph {
		if let object = object as? NSArray where index < object.count {
			return ObjectGraph(object[index])
		} else {
			return ObjectGraph()
		}
	}
	
	
	subscript(key: String) -> ObjectGraph {
		get {
			if let object = object as? NSDictionary {
				return ObjectGraph(object[key])
			} else {
				return ObjectGraph()
			}
		}
	}
	
	var first: ObjectGraph {
		return self[0]
	}
	
	var last: ObjectGraph {
		return self[self.count - 1]
	}
}
