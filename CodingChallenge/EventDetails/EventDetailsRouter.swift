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
    
    static func createEventDetailsView(event: Event?) -> EventDetailsView {
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! EventDetailsView
        var presenter: EventDetailsPresenterProtocol & EventDetailsInteractorOutputProtocol = EventDetailsPresenter()
        let interactor: EventDetailsInteractorInputProtocol = EventDetailsInteractor(event: event)
        let router: EventDetailsRouterProtocol = EventDetailsRouter()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
}
