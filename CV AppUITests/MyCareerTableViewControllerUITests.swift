import XCTest

class MyCareerTableViewControllerUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test display the navegation bar
    var isDisplayingMyCareerNavegationBar: Bool {
        return app.navigationBars[AccessibilityIdentifiers.myCareerNavBar.rawValue].exists
    }
    
    func testDisplayTheNavBar() {
        app.buttons[AccessibilityIdentifiers.moreInfo.rawValue].tap()
        XCTAssertTrue(isDisplayingMyCareerNavegationBar)
    }
    

}
