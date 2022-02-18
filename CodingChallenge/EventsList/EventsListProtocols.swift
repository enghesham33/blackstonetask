//
//  EventsListProtocols.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

// MARK:- View protocols
// MARK: Presenter -> View
protocol EventsListViewProtocol {
    var presenter: EventsListPresenterProtocol? { get set }
    
    func showLoader()
    func hideLoader()
    func reloadData()
    func showErrorMessage(message: String)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol EventsListPresenterProtocol {
    var view: EventsListViewProtocol? { get set }
    var interactor: EventsListInteractorInputProtocol? { get set }
    var router: EventsListRouterProtocol? { get set }
    
    func viewLoaded()
    func numberOfItems() -> Int
    func getItemForRow(index: Int) -> EventViewItem?
    func getEventsList(searchQuery: String)
    func openEventDetails(event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?)
}

// MARK: Interactor -> Presenter
protocol EventsListInteractorOutputProtocol {
    func showLoader()
    func hideLoader()
    func eventsLoaded()
    func showErrorMessage(message: String)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol EventsListInteractorInputProtocol {
    var presenter: EventsListInteractorOutputProtocol? { get set }
    var APIDataManager: EventsListAPIDataManagerProtocol? { get set }
    var localDatamanager: EventsListLocalDataManagerProtocol? { get set }
    var events: [Event]? { get set }

    func getEventsList(searchQuery: String)
    func isEventInFavourites(eventId: Int) -> Bool
}

// MARK:- Router Protocols
protocol EventsListRouterProtocol {
    static func createEventsListView() -> EventsListView
    func openEventDetails(view: EventsListViewProtocol?, event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?)
}

// MARK:- APIDATAMANAGER Protocols
protocol EventsListAPIDataManagerProtocol {
    func getEvents(searchQuery: String, completionHandler: @escaping ([Event]) -> (), faildHandler: @escaping (StatusServer?) -> Void)
}

// MARK:- LocalDataManager Protocols
protocol EventsListLocalDataManagerProtocol {
    func isEventInFavourites(eventId: Int) -> Bool
}
