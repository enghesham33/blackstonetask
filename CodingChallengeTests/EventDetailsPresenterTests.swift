//
//  EventDetailsPresenterTests.swift
//  CodingChallengeTests
//
//  Created by Hesham Donia on 19/02/2022.
//

import XCTest
@testable import CodingChallenge

class EventDetailsPresenterTests: XCTestCase {
    
    var presenter: (EventDetailsPresenterProtocol & EventDetailsInteractorOutputProtocol)!
    var view = MockEventDetailsView()
    var interactor = MockEventDetailsInteractor(isFavourite: false)
    
    override func setUpWithError() throws {
        presenter = EventDetailsPresenter(eventIndex: 0)
        interactor.presenter = presenter
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
    }
    
    func testIsFavouriteFalse() {
        interactor = MockEventDetailsInteractor(isFavourite: false)
        presenter.changeFavouriteStatus(eventId: 10)
        XCTAssertEqual(interactor.event?.isFavourite, false)
    }
    
    func testIsFavouriteTrue() {
        interactor = MockEventDetailsInteractor(isFavourite: true)
        presenter.interactor = interactor
        presenter.changeFavouriteStatus(eventId: 10)
        XCTAssertEqual(interactor.event?.isFavourite, true)
    }
    
    func testEventIndexIsZero() {
        XCTAssertEqual(presenter.getEventIndex(), 0)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }
}
