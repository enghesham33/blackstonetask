//
//  EventCell.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit
import SDWebImage

class EventCell: UITableViewCell {
    
    public static let idntifier = "EventCell"

    @IBOutlet weak var eventPhotoImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventPlaceLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var favouriteImageView: UIImageView!
    
    var event: Event! {
        didSet {
            if let image = event.performers?.first?.image, let url = URL(string: image) {
                eventPhotoImageView.sd_setImage(with: url, completed: nil)
            }
            
            eventNameLabel.text = event.title
            eventPlaceLabel.text = event.venue?.displayLocation
            let dateInUTC = DateManager.convertStringToDate(dateString: event.dateTimeUTC ?? "", timeZoneId: "UTC")
            let dateInUTCString = DateManager.convertDateToString(date: dateInUTC, format: "EEE, dd MMM yyyy hh:mm a")
            eventTimeLabel.text = DateManager.utcToLocal(dateStr: dateInUTCString, format: "EEE, dd MMM yyyy hh:mm a")
        }
    }
}
