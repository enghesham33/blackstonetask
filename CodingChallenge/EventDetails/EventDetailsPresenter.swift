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
    
    func viewLoaded() {
        view?.showData(event: getEvent())
    }
    
    private func getEvent() -> Event? {
        return interactor?.event
    }
    
}

extension EventDetailsPresenter: EventDetailsInteractorOutputProtocol {
    
}
