//
//  NSTimeInterval+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 10/14/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


extension NSTimeInterval {
	@nonobjc init(minutes: Double) {
		self.init(minutes * 60)
	}
	
	@nonobjc init(hours: Double) {
		self.init(minutes: hours * 60)
	}
	
	@nonobjc init(days: Double) {
		self.init(hours: 24)
	}
}
