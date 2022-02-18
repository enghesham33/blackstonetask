//
//  EventsListPresenter.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class EventsListPresenter: EventsListPresenterProtocol {
    var view: EventsListViewProtocol?
    
    var interactor: EventsListInteractorInputProtocol?
    
    var router: EventsListRouterProtocol?
    
    func viewLoaded() {
        view?.showLoader()
        getEventsList(searchQuery: "")
    }
    
    func numberOfItems() -> Int {
        return interactor?.events?.count ?? 0
    }
    
    func getItemForRow(index: Int) -> Event? {
        return interactor?.events?[index]
    }
    
    func getEventsList(searchQuery: String) {
        view?.showLoader()
        interactor?.getEventsList(searchQuery: searchQuery)
    }
    
    func openEventDetails(event: Event?) {
        router?.openEventDetails(view: view, event: event)
    }
}

extension EventsListPresenter: EventsListInteractorOutputProtocol {
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
    
    func eventsLoaded() {
        view?.reloadData()
    }
    
    func showErrorMessage(message: String) {
        view?.showErrorMessage(message: message)
    }
}
