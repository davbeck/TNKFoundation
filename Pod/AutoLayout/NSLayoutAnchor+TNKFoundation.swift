//
//  NSLayoutAnchor+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 9/25/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import UIKit


@available(iOS 9.0, *)
extension NSLayoutAnchor {
	public func constraintEqualToAnchor(anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
		let constraint = self.constraintEqualToAnchor(anchor, constant: c)
		constraint.priority = priority
		
		return constraint
	}
	
	public func constraintGreaterThanOrEqualToAnchor(anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
		let constraint = self.constraintGreaterThanOrEqualToAnchor(anchor, constant: c)
		constraint.priority = priority
		
		return constraint
	}
	
	public func constraintLessThanOrEqualToAnchor(anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
		let constraint = self.constraintLessThanOrEqualToAnchor(anchor, constant: c)
		constraint.priority = priority
		
		return constraint
	}
}


@available(iOS 9.0, *)
extension UIView {
	public func constraintsEqualToView(view: UIView, withInsets insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
		return [
			self.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: insets.left),
			self.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: insets.top),
			view.rightAnchor.constraintEqualToAnchor(self.rightAnchor, constant: insets.right),
			view.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: insets.bottom),
		]
	}
	
	public func constraintsEqualToLayoutGuide(layoutGuide: UILayoutGuide, withInsets insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
		return [
			self.leftAnchor.constraintEqualToAnchor(layoutGuide.leftAnchor, constant: insets.left),
			self.topAnchor.constraintEqualToAnchor(layoutGuide.topAnchor, constant: insets.top),
			layoutGuide.rightAnchor.constraintEqualToAnchor(self.rightAnchor, constant: insets.right),
			layoutGuide.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: insets.bottom),
		]
	}
}
