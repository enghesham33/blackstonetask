//
//  MockEventsListAPIDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventsListAPIDataManager: EventsListAPIDataManagerProtocol {
    
    var isErrorCase = false
    
    func getEvents(searchQuery: String, completionHandler: @escaping ([Event]) -> (), faildHandler: @escaping (StatusServer?) -> Void) {
        if isErrorCase {
            faildHandler(StatusServer(message: "Mocked Error"))
        } else {
            completionHandler(generateFakeEvents())
        }
        
    }
    
    private func generateFakeEvents() -> [Event] {
        
        let event1 = Event(id: 1, title: "Test event 1", dateTimeUTC: "2022-02-21T15:30:00", venue: Venue(id: 1, type: "mlb", displayLocation: "CAL, USA"), performers: [Performer(id: 1, name: "Performer Test", image: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg")])
        let event2 = Event(id: 2, title: "Test event 2", dateTimeUTC: "2022-02-21T15:30:00", venue: Venue(id: 2, type: "mlb", displayLocation: "Los Angeles, USA"), performers: [Performer(id: 1, name: "Performer Test", image: "https://seatgeek.com/images/performers-landscape/texas-rangers-c2f361/16/huge.jpg")])
        
        return [event1, event2]
    }
}
