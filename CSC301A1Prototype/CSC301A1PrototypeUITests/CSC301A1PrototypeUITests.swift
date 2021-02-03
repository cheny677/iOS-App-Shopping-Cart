//
//  CSC301A1PrototypeUITests.swift
//  CSC301A1PrototypeUITests
//
//  Created by Yutong Chen on 2020-09-23.
//

import XCTest

class when_type_promo_code: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp(){
        super.setUp()
        self.app = XCUIApplication()
        self.app.launch()
    }


    func test_promo_code_should_be_entered_correctly() throws {
                
    
        let enterYourPromoCodeTextField = self.app.textFields["Enter Your Promo Code"]
        enterYourPromoCodeTextField.tap()
        enterYourPromoCodeTextField.typeText("12345\n")
        let apply_btn = self.app.buttons["Apply"]
        apply_btn.tap()
        let correct_text = "12345"
        XCTAssertEqual(enterYourPromoCodeTextField.value as! String, correct_text)

    }

}
