//
//  EventsListWireframe.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit

class EventsListRouter: EventsListRouterProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "EventsListView"
    }
    
    static var storyBoard: UIStoryboard {
        get {
            return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        }
    }
    
    static func createEventsListView() -> EventsListView {
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! EventsListView
        var presenter: EventsListPresenterProtocol & EventsListInteractorOutputProtocol = EventsListPresenter()
        var interactor: EventsListInteractorInputProtocol = EventsListInteractor()
        let apiDataManager: EventsListAPIDataManagerProtocol = EventsListAPIDataManager()
        let localDataManager: EventsListLocalDataManagerProtocol = EventsListLocalDataManager()
        let router: EventsListRouterProtocol = EventsListRouter()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = apiDataManager
        interactor.localDatamanager = localDataManager
        
        return view
    }
    
    func openEventDetails(view: EventsListViewProtocol?, event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?) {
        let eventDetailsView = EventDetailsRouter.createEventDetailsView(event: event, index: index, delegate: delegate)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(eventDetailsView, animated: true)
        }
    }
}
