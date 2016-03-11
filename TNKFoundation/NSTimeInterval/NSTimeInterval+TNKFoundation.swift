//
//  NSTimeInterval+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/14/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


extension NSTimeInterval {
	@nonobjc public init(minutes: Double) {
		self.init(minutes * 60)
	}
	
	@nonobjc public init(hours: Double) {
		self.init(minutes: hours * 60)
	}
	
	@nonobjc public init(days: Double) {
		self.init(hours: days * 24)
	}
}
