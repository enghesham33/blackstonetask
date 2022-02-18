//
//  FavouriteEvent.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import RealmSwift

class FavouriteEvent: Object {
    @objc dynamic var eventId: Int = 0
    
    func initializeFromDB(eventId: Int) -> FavouriteEvent {
        if let event = RealmManager.sharedInstance.getAllDataForObject(FavouriteEvent.self, query: "eventId = \(eventId)").first as? FavouriteEvent {
            return event
        }
        self.eventId = eventId
        return self
    }
}
