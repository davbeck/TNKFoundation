//
//  NSURLQueryItem+TNKSubscript.swift
//  TNKFoundation
//
//  Created by David Beck on 10/21/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import Foundation


extension Collection where Iterator.Element == URLQueryItem {
	public subscript(name: String) -> String? {
		get {
			for item in self {
				if item.name == name {
					return item.value
				}
			}
			
			return nil
		}
	}
}
