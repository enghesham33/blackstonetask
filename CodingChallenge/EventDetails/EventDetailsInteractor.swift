//
//  EventDetailsInteractor.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

class EventDetailsInteractor: EventDetailsInteractorInputProtocol {
    var event: Event?
    
    init(event: Event?) {
        self.event = event
    }
}
