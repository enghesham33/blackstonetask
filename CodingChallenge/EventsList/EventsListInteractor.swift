//
//  EventsListInteractor.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class EventsListInteractor: EventsListInteractorInputProtocol {
    var presenter: EventsListInteractorOutputProtocol?
    
    var APIDataManager: EventsListAPIDataManagerProtocol?
    
    var localDatamanager: EventsListLocalDataManagerProtocol?
    
    var events: [Event]?
    
    func getEventsList(searchQuery: String) {
        APIDataManager?.getEvents(searchQuery: searchQuery, completionHandler: { [weak self] events in
            self?.events = events
            self?.presenter?.eventsLoaded()
            self?.presenter?.hideLoader()
        }, faildHandler: { [weak self] status in
            self?.presenter?.showErrorMessage(message: status?.message ?? "")
            self?.presenter?.hideLoader()
        })
    }
}
