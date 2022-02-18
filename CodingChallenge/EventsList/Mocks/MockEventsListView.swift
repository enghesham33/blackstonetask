//
//  MockEventsListView.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class MockEventsListView: EventsListViewProtocol {
    var presenter: EventsListPresenterProtocol?
    
    var errorMessage: String?
    
    var isShowLoaderCalled = false
    var isHideLoaderCalled = false
    var isReloasdDataCalled = false
    
    func showLoader() {
        isShowLoaderCalled = true
    }
    
    func hideLoader() {
        isHideLoaderCalled = true
    }
    
    func reloadData() {
        isReloasdDataCalled = true
    }
    
    func showErrorMessage(message: String) {
        errorMessage = message
    }
}
