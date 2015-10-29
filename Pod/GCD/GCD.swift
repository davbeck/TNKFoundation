//
//  GCD.swift
//  TNKFoundation
//
//  Created by David Beck on 3/16/15.
//  Copyright (c) 2015 Think Ultimate. All rights reserved.
//

import Foundation


func after(interval: NSTimeInterval, block: dispatch_block_t) {
    DispatchQueue(.Main).after(interval, block: block)
}

struct DispatchQueue: CustomStringConvertible {
    enum Priority {
        case Background
        case Default
        case High
        case Low
        case Main
    }
    
    enum Attribute {
        case Serial
        case Concurrent
    }
    
    
    let dispatchQueue: dispatch_queue_t
    
    var label: String? {
        return String.fromCString(dispatch_queue_get_label(self.dispatchQueue))
    }
    
    var description: String {
        return "Queue (\(label))"
    }
    
    
    static var mainQueue = DispatchQueue(dispatch_get_main_queue())
    
    static var defaultQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
    
    static var highPriorityQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
    
    static var lowPriorityQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0))
    
    static var backgroundQueue = DispatchQueue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
    
    init(_ queue: dispatch_queue_t) {
        dispatchQueue = queue
    }
    
    init(_ priority: Priority) {
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
    
    init(_ label: String, attributes: Attribute = .Serial) {
        switch attributes {
        case .Serial:
            self.init(dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL))
        case .Concurrent:
            self.init(dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT))
        }
    }
    
    init() {
        self.init("")
    }
    
    func async(block: dispatch_block_t) {
        dispatch_async(dispatchQueue, block)
    }
    
    func sync(block: dispatch_block_t) {
        dispatch_sync(dispatchQueue, block)
    }
    
    func after(interval: NSTimeInterval, block: dispatch_block_t) {
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * Double(NSEC_PER_SEC)))
        dispatch_after(when, dispatchQueue, block)
    }
    
    func apply(iterations: Int, block: (Int) -> ()) {
        dispatch_apply(iterations, dispatchQueue, block)
    }
}

struct DispatchGroup {
    let dispatchGroup: dispatch_group_t
    
    init() {
        dispatchGroup = dispatch_group_create()
    }
    
    func async(queue: DispatchQueue, block: dispatch_block_t) {
        self.async(queue.dispatchQueue, block: block)
    }
    
    func async(queue: dispatch_queue_t, block: dispatch_block_t) {
        dispatch_group_async(dispatchGroup, queue, block)
    }
    
    func enter() {
        dispatch_group_enter(dispatchGroup)
    }
    
    func leave() {
        dispatch_group_leave(dispatchGroup)
    }
    
    func notify(queue: DispatchQueue, block: dispatch_block_t) {
        self.notify(queue.dispatchQueue, block: block)
    }
    
    func notify(queue: dispatch_queue_t, block: dispatch_block_t) {
        dispatch_group_notify(dispatchGroup, queue, block)
    }
    
    func wait(timeout: NSTimeInterval = 10) {
        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(timeout * Double(NSEC_PER_SEC)))
        dispatch_group_wait(dispatchGroup, when)
    }
}

func dipatchOnce(predicate: UnsafeMutablePointer<dispatch_once_t>, block: dispatch_block_t) {
    dispatch_once(predicate, block)
}
