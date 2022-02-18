//
//  EventDetailsInteractorTests.swift
//  CodingChallengeTests
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

import XCTest
@testable import CodingChallenge

class EventDetailsInteractorTests: XCTestCase {
    
    var interactor: EventDetailsInteractorInputProtocol!
    let presenter = MockEventDetailsPresenter()
    let localDataManager = MockEventDetailsLocalDataManager()
    
    override func setUpWithError() throws {
        interactor = EventDetailsInteractor(event: generateMockedEventViewItem(isFavourite: false))
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
    }
    
    func testSaveFavourite() {
        interactor.saveToFavourites(eventId: 1)
        XCTAssertEqual(presenter.isFavouriteSavedCalled, true)
        XCTAssertEqual(presenter.isFavouriteRemovedCalled, false)
    }
    
    func testRemoveFavourite() {
        interactor.removeFromFavourites(eventId: 1)
        XCTAssertEqual(presenter.isFavouriteRemovedCalled, true)
        XCTAssertEqual(presenter.isFavouriteSavedCalled, false)
    }
    
    override func tearDownWithError() throws {
        interactor = nil
    }
    
    private func generateMockedEventViewItem(isFavourite: Bool) -> EventViewItem {
        return EventViewItem(id: 1, photoUrl: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg", name: "Test event 1", place: "CAL, USA", time: "2022-02-21T15:30:00", isFavourite: isFavourite)
    }
}
