//
//  MockEventDetailsPresenter.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventDetailsPresenter: EventDetailsInteractorOutputProtocol {
        
    var isFavouriteSavedCalled = false
    var isFavouriteRemovedCalled = false
    
    func favouriteSaved() {
        isFavouriteSavedCalled = true
    }
    
    func favouriteRemoved() {
        isFavouriteRemovedCalled = true
    }
}
