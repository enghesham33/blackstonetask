//
//  MockEventsListPresenter.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventsListPresenter: EventsListInteractorOutputProtocol {
    
    var errorMessage: String?
    
    var isHideLoaderCalled = false
    var isEventsLoadedCalled = false
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        isHideLoaderCalled = true
    }
    
    func showErrorMessage(message: String) {
        errorMessage = message
    }
    
    func eventsLoaded() {
        isEventsLoadedCalled = true
    }
}
