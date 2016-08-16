import XCTest
import TNKFoundation


func XCTAssertEqual(_ expression1: [[String:Any]], _ expression2: [[String:Any]], _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
	XCTAssertEqual(expression1 as NSArray, expression2 as NSArray, message, file: file, line: line)
}


class NSPredicateTests: XCTestCase {
	let john: [String:Any] = [
		"name": "John Burke",
		"age": 33,
		"gender": "male",
	]
	let jane: [String:Any] = [
		"name": "Jane Burke",
		"age": 33,
		"gender": "female",
	]
	let frank: [String:Any] = [
		"name": "Frank Burke",
		"age": 13,
		"gender": "male",
	]
	let grace: [String:Any] = [
		"name": "Grace Burke",
		"age": 4,
		"gender": "female",
	]
	
	lazy var data: [[String:Any]] = [
		self.john,
		self.jane,
		self.frank,
		self.grace,
	]
	
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
	}
	
	func testEquals() {
		do {
			let predicate = %"age" %== %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = "foo" %== "foo"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %== 33
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 33 %== %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testNotEqual() {
		do {
			let predicate = %"age" %!= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = "foo" %!= "foo"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %!= 33
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 33 %!= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testLessThanOrEqual() {
		do {
			let predicate = %"age" %<= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %<= NSNumber(value: 3)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %<= NSNumber(value: 5)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %<= NSNumber(value: 8)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %<= 13
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %<= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testLessThan() {
		do {
			let predicate = %"age" %< %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %< NSNumber(value: 3)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %< NSNumber(value: 5)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %< NSNumber(value: 8)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %< 13
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %< %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testGreaterThanOrEqual() {
		do {
			let predicate = %"age" %>= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %>= NSNumber(value: 3)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %>= NSNumber(value: 5)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %>= NSNumber(value: 8)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %>= 13
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane, frank ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %>= %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testGreaterThan() {
		do {
			let predicate = %"age" %> %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %> NSNumber(value: 3)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %> NSNumber(value: 5)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(value: 5) %> NSNumber(value: 8)
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %> 13
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %> %"age"
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testMatches() {
		do {
			let predicate = NSComparisonPredicate("john@example.com", .matches, ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*")
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate("example.com", .matches, ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*")
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate(%"gender", .matches, ".*male")
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate(%"gender", .matches, "fe.*le")
			let subData = data.filter(predicate.evaluate)
			
			let expected: [[String:Any]] = [jane, grace]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testAnd() {
		let predicate = %"age" %== 33 && %"gender" %== "male"
		let subData = data.filter(predicate.evaluate)
		
		let expected: [[String:Any]] = [ john ]
		XCTAssertEqual(subData, expected)
	}
	
	func testOr() {
		let predicate = %"age" %== 33 || %"gender" %== "male"
		let subData = data.filter(predicate.evaluate)
		
		let expected: [[String:Any]] = [ john, jane, frank ]
		XCTAssertEqual(subData, expected)
	}
	
	func testNot() {
		let predicate = !(%"age" %== 33)
		let subData = data.filter(predicate.evaluate)
		
		let expected: [[String:Any]] = [ frank, grace ]
		XCTAssertEqual(subData, expected)
	}
}
