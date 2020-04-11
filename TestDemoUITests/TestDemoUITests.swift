//
//  TestDemoUITests.swift
//  TestDemoUITests
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import XCTest

class TestDemoUITests: XCTestCase
{

    override func setUp()
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Private Methods
    
    private func login(username: String = "climber@gmail.com", password: String = "climber", tap: Bool = true)
    {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tfUsername = app.textFields["Username"]
        let tfPassword = app.secureTextFields["Password"]
        let btnLogin = app.buttons["LOGIN"]
        
        tfUsername.tap()
        tfUsername.typeText(username)
        tfPassword.tap()
        tfPassword.typeText(password)
        
        if tap { btnLogin.tap() }
    }
    
    // MARK: - Test cases
    
    func testLoginEnabled()
    {
        login(username: "climber@gmail.com", password: "climber", tap: false)
        
        //correct login credentials, login button should be enabled
        XCTAssertTrue(XCUIApplication().buttons["LOGIN"].isEnabled)
    }
    
    func testLoginDisabled()
    {
        login(username: "climber1@gmail.com", password: "climber1", tap: false)
        
        //wrong login credentials, login button should be disabled
        XCTAssertFalse(XCUIApplication().buttons["LOGIN"].isEnabled)
    }

    func testSuccessLogin()
    {
        login()
        
        //next screen, should see "Climber" label
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: XCUIApplication().staticTexts["Climber"], handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testSteps()
    {
        login()
        
        //next screen, should see "14000", "Today", "Steps" labels
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: XCUIApplication().staticTexts["14000"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: XCUIApplication().staticTexts["Today"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: XCUIApplication().staticTexts["Steps"], handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }
}
