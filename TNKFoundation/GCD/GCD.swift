//
//  GCD.swift
//  TNKFoundation
//
//  Created by David Beck on 3/16/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


public func after(interval: NSTimeInterval, block: dispatch_block_t) {
	DispatchQueue(priority: .Main).after(interval, block: block)
}

public struct DispatchQueue: CustomStringConvertible {
	public enum Priority {
		case Background
		case Default
		case High
		case Low
		case Main
	}
	
	public enum Attribute {
		case Serial
		case Concurrent
	}
	
	
	public let dispatchQueue: dispatch_queue_t
	
	public var label: String? {
		return String.fromCString(dispatch_queue_get_label(self.dispatchQueue))
	}
	
	public var description: String {
		return "Queue (\(label))"
	}
	
	
	public static var mainQueue = DispatchQueue(dispatch_get_main_queue())
	
	public static var defaultQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
	
	public static var highPriorityQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
	
	public static var lowPriorityQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0))
	
	public static var backgroundQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
	
	public init(_ queue: dispatch_queue_t) {
		dispatchQueue = queue
	}
	
	public init(priority: Priority) {
		switch priority {
		case .Background:
			self.init(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
		case .Default:
			self.init(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
		case .High:
			self.init(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
		case .Low:
			self.init(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0))
		default:
			self.init(dispatch_get_main_queue())
		}
	}
	
	public init(label: String, attributes: Attribute = .Serial) {
		switch attributes {
		case .Serial:
			self.init(dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL))
		case .Concurrent:
			self.init(dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT))
		}
	}
	
	public init() {
		self.init(label: "")
	}
	
	public func async(block: dispatch_block_t) {
		dispatch_async(dispatchQueue, block)
	}
	
	public func sync(block: dispatch_block_t) {
		dispatch_sync(dispatchQueue, block)
	}
	
	public func after(interval: NSTimeInterval, block: dispatch_block_t) {
		let when = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * Double(NSEC_PER_SEC)))
		dispatch_after(when, dispatchQueue, block)
	}
	
	public func apply(iterations: Int, block: (Int) -> ()) {
		dispatch_apply(iterations, dispatchQueue, block)
	}
}

public struct DispatchGroup {
	public let dispatchGroup: dispatch_group_t
	
	public init() {
		self.init(dispatch_group_create())
	}
	
	public init(_ dispatchGroup: dispatch_group_t) {
		self.dispatchGroup = dispatchGroup
	}
	
	public func async(queue: DispatchQueue, block: dispatch_block_t) {
		self.async(queue.dispatchQueue, block: block)
	}
	
	public func async(queue: dispatch_queue_t, block: dispatch_block_t) {
		dispatch_group_async(dispatchGroup, queue, block)
	}
	
	public func enter() {
		dispatch_group_enter(dispatchGroup)
	}
	
	public func leave() {
		dispatch_group_leave(dispatchGroup)
	}
	
	public func notify(queue: DispatchQueue, block: dispatch_block_t) {
		self.notify(queue.dispatchQueue, block: block)
	}
	
	public func notify(queue: dispatch_queue_t, block: dispatch_block_t) {
		dispatch_group_notify(dispatchGroup, queue, block)
	}
	
	public func wait(timeout: NSTimeInterval = 10) {
		let when = dispatch_time(DISPATCH_TIME_NOW, Int64(timeout * Double(NSEC_PER_SEC)))
		dispatch_group_wait(dispatchGroup, when)
	}
}

public func dipatchOnce(predicate: UnsafeMutablePointer<dispatch_once_t>, block: dispatch_block_t) {
	dispatch_once(predicate, block)
}
