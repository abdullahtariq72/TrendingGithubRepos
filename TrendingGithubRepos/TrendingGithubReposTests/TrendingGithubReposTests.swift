//
//  TrendingGithubReposTests.swift
//  TrendingGithubReposTests
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import XCTest
@testable import TrendingGithubRepos

class TrendingGithubReposTests: XCTestCase {

   
    func test_get_repo_list(){
        let expectation = self.expectation(description: "get_repo_list")
        RepoListService.shared.getRepoListData(completion: { (repoListResponse: GithubReposListModel?, message: String?) in
            if let response = repoListResponse{
                XCTAssertNotNil(response.items)
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    

}
