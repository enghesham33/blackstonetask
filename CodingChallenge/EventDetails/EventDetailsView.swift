//
//  EventDetailsView.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit

class EventDetailsView: BaseView {
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventPhotoImageView: UIImageView!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventPlaceLabel: UILabel!
    
    var presenter: EventDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func favouriteButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension EventDetailsView: EventDetailsViewProtocol {
    func showData(event: Event?) {
        if let event = event {
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
