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
    
    func showData(event: Event?)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol EventDetailsPresenterProtocol {
    var view: EventDetailsViewProtocol? { get set }
    var interactor: EventDetailsInteractorInputProtocol? { get set }
    var router: EventDetailsRouterProtocol? { get set }
    
    func viewLoaded()
}

// MARK: Interactor -> Presenter
protocol EventDetailsInteractorOutputProtocol {
    
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol EventDetailsInteractorInputProtocol {
    var event: Event? { get set }
}

// MARK:- Router Protocols
protocol EventDetailsRouterProtocol {
    static func createEventDetailsView(event: Event?) -> EventDetailsView
}
