//
//  EventsListLocalDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class EventDetailsLocalDataManager: EventDetailsLocalDataManagerProtocol {
    
    func saveToFavourites(eventId: Int, completion : @escaping() -> ()) {
        RealmManager.sharedInstance.add(FavouriteEvent().initializeFromDB(eventId: eventId)) {
            completion()
        }
    }
    
    func removeFromFavourites(eventId: Int, completion : @escaping() -> ()) {
        RealmManager.sharedInstance.delete(FavouriteEvent().initializeFromDB(eventId: eventId)) {
            completion()
        }
    }
}
