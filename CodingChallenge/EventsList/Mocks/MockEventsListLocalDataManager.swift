//
//  MockEventsListLocalDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventsListLocalDataManager: EventsListLocalDataManagerProtocol {
    func isEventInFavourites(eventId: Int) -> Bool {
        return true
    }
}
