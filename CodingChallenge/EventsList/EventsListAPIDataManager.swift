//
//  EventsListAPIDataManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class EventsListAPIDataManager: EventsListAPIDataManagerProtocol {
    func getEvents(searchQuery: String, completionHandler: @escaping ([Event]) -> (), faildHandler: @escaping (StatusServer?) -> Void) {
        
        var params = ["client_id": clientId]
        if !searchQuery.isEmpty {
            params["q"] = searchQuery
        }
        
        NetworkingManager.sharedInstance.makeRequest(mType: .get, params: params) { data in
            let eventsResponse = try! JSONDecoder().decode(EventsResponse.self, from: data)
            completionHandler(eventsResponse.events ?? [])
        } faildHandler: { status in
            faildHandler(status)
        }
    }
}
