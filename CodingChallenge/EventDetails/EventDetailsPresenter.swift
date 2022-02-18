//
//  EventDetailsPresenter.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

class EventDetailsPresenter: EventDetailsPresenterProtocol {
    
    var view: EventDetailsViewProtocol?
    
    var interactor: EventDetailsInteractorInputProtocol?
    
    var router: EventDetailsRouterProtocol?
    var eventIndex: Int?
    
    init(eventIndex: Int?) {
        self.eventIndex = eventIndex
    }
    
    func viewLoaded() {
        view?.showData(event: getEvent())
    }
    
    func changeFavouriteStatus(eventId: Int) {
        if getEvent()?.isFavourite ?? false {
            interactor?.removeFromFavourites(eventId: eventId)
        } else {
            interactor?.saveToFavourites(eventId: eventId)
        }
    }
    
    func getEvent() -> EventViewItem? {
        return interactor?.event
    }
    
    func getEventIndex() -> Int? {
        return eventIndex
    }
}

extension EventDetailsPresenter: EventDetailsInteractorOutputProtocol {
    func favouriteSaved() {
        view?.refreshFavouriteButtonIcon(isFavourite: true)
    }
    
    func favouriteRemoved() {
        view?.refreshFavouriteButtonIcon(isFavourite: false)
    }
}
