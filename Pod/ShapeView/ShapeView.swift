//
//  ShapeView.swift
//  TNKFoundation
//
//  Created by David Beck on 10/14/14.
//  Copyright (c) 2014 Think Ultimate. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
    
    var shapeLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    @NSCopying var path: UIBezierPath?
    
    var fillColor: UIColor? {
        get {
			if let fillColor = self.shapeLayer.fillColor {
				return UIColor(CGColor: fillColor)
			} else {
				return nil
			}
        }
		set {
			self.shapeLayer.fillColor = fillColor?.CGColor
        }
    }
    
    enum FillRule {
        case NonZero
        case EvenOdd
    }
    
    var fillRule: FillRule {
        get {
            switch self.shapeLayer.fillRule {
            case kCAFillRuleNonZero:
                return .NonZero
            case kCAFillRuleEvenOdd:
                return .EvenOdd
            default:
                return .NonZero
            }
        }
        set {
            switch fillRule {
            case .NonZero:
                self.shapeLayer.fillRule = kCAFillRuleNonZero
            case .EvenOdd:
                self.shapeLayer.fillRule = kCAFillRuleEvenOdd
            }
        }
    }
    
    enum LineCap {
        case Butt
        case Round
        case Square
    }
    
    var lineCap: LineCap {
        get {
            switch self.shapeLayer.lineCap {
            case kCALineCapButt:
                return .Butt
            case kCALineCapRound:
                return .Round
            case kCALineCapSquare:
                return .Square
            default:
                return .Butt
            }
        }
        set {
            switch lineCap {
            case .Butt:
                self.shapeLayer.lineCap = kCALineCapButt
            case .Round:
                self.shapeLayer.lineCap = kCALineCapRound
            case .Square:
                self.shapeLayer.lineCap = kCALineCapSquare
            }
        }
    }
    
    var lineDashPattern: [Int] {
        get {
            return self.shapeLayer.lineDashPattern?.map { (number) -> Int in
                return number.integerValue
            } ?? []
        }
        set {
            self.shapeLayer.lineDashPattern = lineDashPattern.map({ (integer) -> NSNumber in
                return NSNumber(integer: integer)
            })
        }
    }
    
    var lineDashPhase: CGFloat {
        get {
            return self.shapeLayer.lineDashPhase
        }
        set {
            self.shapeLayer.lineDashPhase = lineDashPhase
        }
    }
    
    enum LineJoin {
        case Miter
        case Round
        case Bevel
    }
    
    var lineJoin: LineJoin {
        get {
            switch self.shapeLayer.lineJoin {
            case kCALineJoinMiter:
                return .Miter
            case kCALineJoinRound:
                return .Round
            case kCALineJoinBevel:
                return .Bevel
            default:
                return .Miter
            }
        }
        set {
            switch lineJoin {
            case .Miter:
                self.shapeLayer.lineJoin = kCALineJoinMiter
            case .Round:
                self.shapeLayer.lineJoin = kCALineJoinRound
            case .Bevel:
                self.shapeLayer.lineJoin = kCALineJoinBevel
            }
        }
    }
    
    var lineWidth: CGFloat {
        get {
            return self.shapeLayer.lineWidth
        }
        set {
            self.shapeLayer.lineWidth = lineWidth
        }
    }
    
    var miterLimit: CGFloat {
        get {
            return self.shapeLayer.miterLimit
        }
        set {
            self.shapeLayer.miterLimit = miterLimit
        }
    }
    
    var strokeColor: UIColor? {
        get {
			if let strokeColor = self.shapeLayer.strokeColor {
				return UIColor(CGColor: strokeColor)
			} else {
				return nil
			}
        }
		set {
			self.shapeLayer.strokeColor = strokeColor?.CGColor
        }
    }
    
    var strokeStart: CGFloat {
        get {
            return self.shapeLayer.strokeStart
        }
        set {
            self.shapeLayer.strokeStart = strokeStart
        }
    }
    
    var strokeEnd: CGFloat {
        get {
            return self.shapeLayer.strokeEnd
        }
        set {
            self.shapeLayer.strokeEnd = strokeEnd
        }
    }
    
    enum SystemShape {
        case PlayIcon
    }
    
    convenience init(systemShape: SystemShape) {
        self.init()
        
        self.contentMode = .ScaleToFill
        self.fillColor = UIColor.blackColor()
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0.0, y: 0.0))
        path.addLineToPoint(CGPoint(x: 1.0, y: 0.5))
        path.addLineToPoint(CGPoint(x: 0.0, y: 1.0))
        path.closePath()
        self.path = path
    }
    
    override func layoutSubviews() {
        if let path = self.path {
            let scaledPath = path.copy() as! UIBezierPath
            switch self.contentMode {
            case .ScaleToFill:
                scaledPath.applyTransform(CGAffineTransformMakeTranslation(-scaledPath.bounds.origin.x, -scaledPath.bounds.origin.y))
                scaledPath.applyTransform(CGAffineTransformMakeScale(self.bounds.size.width / scaledPath.bounds.size.width, self.bounds.size.height / scaledPath.bounds.size.height))
            default:
                break
            }
            
            self.shapeLayer.path = scaledPath.CGPath
        }
    }
}