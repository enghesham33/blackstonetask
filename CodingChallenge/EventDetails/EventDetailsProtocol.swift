//
//  EventDetailsProtocol.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol EventDetailsViewProtocol {
    var presenter: EventDetailsPresenterProtocol? { get set }
    var delegate: EventDetailsDelegate? {get}
    
    func showData(event: EventViewItem?)
    func refreshFavouriteButtonIcon(isFavourite: Bool)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol EventDetailsPresenterProtocol {
    var view: EventDetailsViewProtocol? { get set }
    var interactor: EventDetailsInteractorInputProtocol? { get set }
    var router: EventDetailsRouterProtocol? { get set }
    var eventIndex: Int? { get }
    
    func viewLoaded()
    func changeFavouriteStatus(eventId: Int)
    func getEvent() -> EventViewItem?
    func getEventIndex() -> Int?
}

// MARK: Interactor -> Presenter
protocol EventDetailsInteractorOutputProtocol {
    func favouriteSaved()
    func favouriteRemoved()
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol EventDetailsInteractorInputProtocol {
    var event: EventViewItem? { get set }
    var presenter: EventDetailsInteractorOutputProtocol? { get set }
    var localDatamanager: EventDetailsLocalDataManagerProtocol? { get set }
    func saveToFavourites(eventId: Int)
    func removeFromFavourites(eventId: Int)
}

// MARK:- Router Protocols
protocol EventDetailsRouterProtocol {
    static func createEventDetailsView(event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?) -> EventDetailsView
}

// MARK:- LocalDataManager Protocols
protocol EventDetailsLocalDataManagerProtocol {
    func saveToFavourites(eventId: Int, completion : @escaping() -> ())
    func removeFromFavourites(eventId: Int, completion : @escaping() -> ())
}

protocol EventDetailsDelegate {
    func refreshFavourite(eventIndex: Int, isFavourite: Bool)
}
