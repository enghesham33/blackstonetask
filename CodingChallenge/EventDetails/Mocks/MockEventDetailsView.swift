//
//  MockEventDetailsView.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 19/02/2022.
//

import Foundation

class MockEventDetailsView: EventDetailsViewProtocol {
    var delegate: EventDetailsDelegate?
    var presenter: EventDetailsPresenterProtocol?
    
    var isShowDataCalled = false
    var isRefreshCalled = false
    
    func showData(event: EventViewItem?) {
        isShowDataCalled = true
    }
    
    func refreshFavouriteButtonIcon(isFavourite: Bool) {
        isRefreshCalled = true
    }
}
