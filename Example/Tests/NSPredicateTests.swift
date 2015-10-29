import XCTest
import TNKFoundation


class NSPredicateTests: XCTestCase {
	let john = [
		"name": "John Burke",
		"age": 33,
		"gender": "male",
	]
	let jane = [
		"name": "Jane Burke",
		"age": 33,
		"gender": "female",
	]
	let frank = [
		"name": "Frank Burke",
		"age": 13,
		"gender": "male",
	]
	let grace = [
		"name": "Grace Burke",
		"age": 4,
		"gender": "female",
	]
	
	lazy var data: NSSet = [
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
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = "foo" %== "foo"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %== 33
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 33 %== %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testNotEqual() {
		do {
			let predicate = %"age" %!= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = "foo" %!= "foo"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %!= 33
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 33 %!= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testLessThanOrEqual() {
		do {
			let predicate = %"age" %<= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %<= NSNumber(3)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %<= NSNumber(5)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %<= NSNumber(8)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %<= 13
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %<= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testLessThan() {
		do {
			let predicate = %"age" %< %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %< NSNumber(3)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %< NSNumber(5)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %< NSNumber(8)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %< 13
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ grace ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %< %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testGreaterThanOrEqual() {
		do {
			let predicate = %"age" %>= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %>= NSNumber(3)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %>= NSNumber(5)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %>= NSNumber(8)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %>= 13
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, john, jane ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %>= %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testGreaterThan() {
		do {
			let predicate = %"age" %> %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %> NSNumber(3)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %> NSNumber(5)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSNumber(5) %> NSNumber(8)
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = %"age" %> 13
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ john, jane ]
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = 14 %> %"age"
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [ frank, grace ]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testMatches() {
		do {
			let predicate = NSComparisonPredicate("john@example.com", .Matches, ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*")
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate("example.com", .Matches, ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*")
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = []
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate(%"gender", .Matches, ".*male")
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = data
			XCTAssertEqual(subData, expected)
		}
		
		do {
			let predicate = NSComparisonPredicate(%"gender", .Matches, "fe.*le")
			let subData = data.filteredSetUsingPredicate(predicate)
			
			let expected: NSSet = [jane, grace]
			XCTAssertEqual(subData, expected)
		}
	}
	
	func testAnd() {
		let predicate = %"age" %== 33 && %"gender" %== "male"
		let subData = data.filteredSetUsingPredicate(predicate)
		
		let expected: NSSet = [ john ]
		XCTAssertEqual(subData, expected)
	}
	
	func testOr() {
		let predicate = %"age" %== 33 || %"gender" %== "male"
		let subData = data.filteredSetUsingPredicate(predicate)
		
		let expected: NSSet = [ john, jane, frank ]
		XCTAssertEqual(subData, expected)
	}
	
	func testNot() {
		let predicate = !(%"age" %== 33)
		let subData = data.filteredSetUsingPredicate(predicate)
		
		let expected: NSSet = [ frank, grace ]
		XCTAssertEqual(subData, expected)
	}
}
