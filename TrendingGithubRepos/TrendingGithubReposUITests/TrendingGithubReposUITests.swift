//
//  TrendingGithubReposUITests.swift
//  TrendingGithubReposUITests
//
//  Created by Abdullah Tariq on 16/05/2022.
//
import Foundation
import XCTest
import TrendingGithubRepos

class TrendingGithubReposUITests: XCTestCase {
    
    override func setUp() {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testShimmerCell() throws {
        
        let table = XCUIApplication().tables
        XCTAssertNotNil((table.cells.matching(identifier: "listShimmerCell_id")))
    }
    
    func testRepoListCell() throws {
        
        let table = XCUIApplication().tables
        XCTAssertNotNil((table.cells.matching(identifier: "repoListTableViewCell_id")))
    }
    
    func test_Expand_UnExpandCellTap() throws {
        
        let app = XCUIApplication()
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.tap()
        let secondCell = app.tables.cells.element(boundBy: 2)
        secondCell.tap()
        
        sleep(3)
        firstCell.tap()
        
        sleep(2)
        secondCell.tap()
    }
    
    func test_scrollTable_cellTap(){
        
        let app = XCUIApplication()
        let listpagetableviewTable = app.tables
        
        let cell = listpagetableviewTable.staticTexts["less.js"]
        while !cell.exists {
            app.swipeUp()
        }
        
        cell.tap()
    }
}
