//
//  EventsListLocalDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class EventsListLocalDataManager: EventsListLocalDataManagerProtocol {
    func isEventInFavourites(eventId: Int) -> Bool {
        return !RealmManager.sharedInstance.getAllDataForObject(FavouriteEvent.self, query: "eventId = \(eventId)").isEmpty
    }
}
