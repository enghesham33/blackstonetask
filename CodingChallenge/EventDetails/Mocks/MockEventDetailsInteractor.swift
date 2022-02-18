//
//  MockEventDetailsInteractor.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventDetailsInteractor: EventDetailsInteractorInputProtocol {
    
    var event: EventViewItem?
    
    var presenter: EventDetailsInteractorOutputProtocol?
    
    var localDatamanager: EventDetailsLocalDataManagerProtocol?
    
    init(isFavourite: Bool) {
        event = generateMockedEventViewItem(isFavourite: isFavourite)
    }
    
    func saveToFavourites(eventId: Int) {
        localDatamanager?.saveToFavourites(eventId: eventId, completion: { [weak self] in
            self?.presenter?.favouriteSaved()
        })
    }
    
    func removeFromFavourites(eventId: Int) {
        localDatamanager?.removeFromFavourites(eventId: eventId, completion: { [weak self] in
            self?.presenter?.favouriteSaved()
        })
    }
    
    private func generateMockedEventViewItem(isFavourite: Bool) -> EventViewItem {
        return EventViewItem(id: 1, photoUrl: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg", name: "Test event 1", place: "CAL, USA", time: "2022-02-21T15:30:00", isFavourite: isFavourite)
    }
}
