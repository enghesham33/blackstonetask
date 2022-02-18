//
//  MockEventDetailsInteractor.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class MockEventsListInteractor: EventsListInteractorInputProtocol {
    var presenter: EventsListInteractorOutputProtocol?
    
    var APIDataManager: EventsListAPIDataManagerProtocol?
    
    var localDatamanager: EventsListLocalDataManagerProtocol?
    
    var events: [Event]?
    
    func getEventsList(searchQuery: String) {
        generateFakeEvents()
        presenter?.hideLoader()
        presenter?.eventsLoaded()
    }
    
    func isEventInFavourites(eventId: Int) -> Bool {
        return false
    }
    
    private func generateFakeEvents() {
        
        let event1 = Event(id: 1, title: "Test event 1", dateTimeUTC: "2022-02-21T15:30:00", venue: Venue(id: 1, type: "mlb", displayLocation: "CAL, USA"), performers: [Performer(id: 1, name: "Performer Test", image: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg")])
        let event2 = Event(id: 2, title: "Test event 2", dateTimeUTC: "2022-02-21T15:30:00", venue: Venue(id: 2, type: "mlb", displayLocation: "Los Angeles, USA"), performers: [Performer(id: 1, name: "Performer Test", image: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg")])
        
        events = [event1, event2]
    }
    
}
