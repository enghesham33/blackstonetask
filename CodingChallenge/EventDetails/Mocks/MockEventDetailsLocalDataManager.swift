//
//  MockEventDetailsLocalDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventDetailsLocalDataManager: EventDetailsLocalDataManagerProtocol {
    
    func saveToFavourites(eventId: Int, completion: @escaping () -> ()) {
        completion()
    }
    
    func removeFromFavourites(eventId: Int, completion: @escaping () -> ()) {
        completion()
    }
}
