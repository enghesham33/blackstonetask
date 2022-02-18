//
//  File.swift
//  CodingChallengeTests
//
//  Created by Hesham Donia on 19/02/2022.
//

import XCTest
@testable import CodingChallenge

class EventsListInteractorTests: XCTestCase {
    
    var interactor: EventsListInteractorInputProtocol!
    let presenter = MockEventsListPresenter()
    let localDataManager = MockEventsListLocalDataManager()
    let apiDataManager = MockEventsListAPIDataManager()
    
    override func setUpWithError() throws {
        interactor = EventsListInteractor()
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
    }
    
    func testGetEventsListSuccess() {
        apiDataManager.isErrorCase = false
        interactor.APIDataManager = apiDataManager
        interactor.getEventsList(searchQuery: "")
        XCTAssertEqual(interactor.events?.count ?? 0, 2)
        XCTAssertEqual(presenter.isHideLoaderCalled, true)
        XCTAssertEqual(presenter.isEventsLoadedCalled, true)
    }
    
    func testGetEventsListFailed() {
        apiDataManager.isErrorCase = true
        interactor.APIDataManager = apiDataManager
        interactor.getEventsList(searchQuery: "")
        XCTAssertEqual(presenter.isHideLoaderCalled, true)
        XCTAssertEqual(presenter.isEventsLoadedCalled, false)
        XCTAssertEqual(presenter.errorMessage, "Mocked Error")
    }
    
    override func tearDownWithError() throws {
        interactor = nil
    }
}
