//
//  EventDetailsRouter.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit

class EventDetailsRouter: EventDetailsRouterProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "EventDetailsView"
    }
    
    static var storyBoard: UIStoryboard {
        get {
            return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        }
    }
    
    static func createEventDetailsView(event: EventViewItem?, index: Int, delegate: EventDetailsDelegate?) -> EventDetailsView {
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! EventDetailsView
        var presenter: EventDetailsPresenterProtocol & EventDetailsInteractorOutputProtocol = EventDetailsPresenter(eventIndex: index)
        var interactor: EventDetailsInteractorInputProtocol = EventDetailsInteractor(event: event)
        let router: EventDetailsRouterProtocol = EventDetailsRouter()
        let localDataManager: EventDetailsLocalDataManagerProtocol = EventDetailsLocalDataManager()
        
        // Connecting
        view.presenter = presenter
        view.delegate = delegate
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        
        return view
    }
}
