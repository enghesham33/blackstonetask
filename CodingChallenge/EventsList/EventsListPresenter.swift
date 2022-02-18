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
    
    func getItemForRow(index: Int) -> EventViewItem? {
        let event = interactor?.events?[index]
        let dateInUTC = DateManager.convertStringToDate(dateString: event?.dateTimeUTC ?? "", timeZoneId: "UTC")
        let dateInUTCString = DateManager.convertDateToString(date: dateInUTC, format: "EEE, dd MMM yyyy hh:mm a")
                
        return EventViewItem(id: event?.id, photoUrl: event?.performers?.first?.image, name: event?.title, place: event?.venue?.displayLocation, time: DateManager.utcToLocal(dateStr: dateInUTCString, format: "EEE, dd MMM yyyy hh:mm a"), isFavourite: interactor?.isEventInFavourites(eventId: event?.id ?? 0) ?? false)
    }
    
    func getEventsList(searchQuery: String) {
        view?.showLoader()
        interactor?.getEventsList(searchQuery: searchQuery)
    }
    
    func openEventDetails(event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?) {
        router?.openEventDetails(view: view, event: event, index: index, delegate: delegate)
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
