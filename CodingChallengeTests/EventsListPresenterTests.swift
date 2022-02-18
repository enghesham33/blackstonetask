//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Hesham Donia on 18/02/2022.
//

import XCTest
@testable import CodingChallenge

class EventsListPresenterTests: XCTestCase {
    
    var presenter: (EventsListPresenterProtocol & EventsListInteractorOutputProtocol)!
    var view = MockEventsListView()
    var interactor = MockEventsListInteractor()

    override func setUpWithError() throws {
        presenter = EventsListPresenter()
        interactor.presenter = presenter
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
    }
    
    func testGetEventsList() {
        presenter.getEventsList(searchQuery: "")
        XCTAssertEqual(interactor.events?.count ?? 0, 2)
    }
    
    func testEventIsInFavourites() {
        let itemView = presenter.getItemForRow(index: 0)
        XCTAssertEqual(itemView?.isFavourite ?? false, false)
    }
    
    func testLoaderCall() {
        presenter.getEventsList(searchQuery: "")
        XCTAssertEqual(view.isShowLoaderCalled, true)
        XCTAssertEqual(view.isHideLoaderCalled, true)
        XCTAssertEqual(view.isReloasdDataCalled, true)
    }
    
    func testErrorMessage() {
        presenter.showErrorMessage(message: noInternetConnectionMessage)
        XCTAssertEqual(view.errorMessage, noInternetConnectionMessage)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

}
