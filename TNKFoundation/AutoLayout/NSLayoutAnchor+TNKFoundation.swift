//
//  NSLayoutAnchor+TNKFoundation.swift
//  TNKFoundation
//
//  Created by David Beck on 9/25/15.
//  Copyright © 2015 Think Ultimate. All rights reserved.
//

import UIKit


//@available(iOS 9.0, *)
//extension NSLayoutAnchor {
//	public func constraintEqualToAnchor(_ anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
//		let constraint = self.constraint(equalTo: anchor, constant: c)
//		constraint.priority = priority
//		
//		return constraint
//	}
//	
//	public func constraintGreaterThanOrEqualToAnchor(_ anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
//		let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
//		constraint.priority = priority
//		
//		return constraint
//	}
//	
//	public func constraintLessThanOrEqualToAnchor(_ anchor: NSLayoutAnchor, constant c: CGFloat = 0, priority: UILayoutPriority) -> NSLayoutConstraint {
//		let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
//		constraint.priority = priority
//		
//		return constraint
//	}
//}
//
//
//@available(iOS 9.0, *)
//extension UIView {
//	public func constraintsEqualToView(_ view: UIView, withInsets insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
//		return [
//			self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
//			self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
//			view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: insets.right),
//			view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom),
//		]
//	}
//	
//	public func constraintsEqualToLayoutGuide(_ layoutGuide: UILayoutGuide, withInsets insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
//		return [
//			self.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left),
//			self.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
//			layoutGuide.rightAnchor.constraint(equalTo: self.rightAnchor, constant: insets.right),
//			layoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom),
//		]
//	}
//}
