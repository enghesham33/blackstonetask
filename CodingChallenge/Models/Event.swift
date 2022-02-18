//
//  Event.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation


class EventsResponse: Codable {
    var events: [Event]?
}

class Event: Codable {
    var id: Int?
    var title: String?
    var dateTimeUTC: String?
    var venue: Venue?
    var performers: [Performer]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, venue, performers
        case dateTimeUTC = "datetime_utc"
    }
}

class Venue: Codable {
    var id: Int?
    var type: String?
    var displayLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case id, type
        case displayLocation = "display_location"
    }
}

class Performer: Codable {
    var id: Int?
    var name: String?
    var image: String?
}
