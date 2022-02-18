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
    var delegate: EventDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func favouriteButtonPressed(_ sender: Any) {
        presenter?.changeFavouriteStatus(eventId: presenter?.getEvent()?.id ?? 0)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        delegate?.refreshFavourite(eventIndex: presenter?.getEventIndex() ?? -1, isFavourite: presenter?.getEvent()?.isFavourite ?? false)
        navigationController?.popViewController(animated: true)
    }
}

extension EventDetailsView: EventDetailsViewProtocol {
    func showData(event: EventViewItem?) {
        if let event = event {
            if let image = event.photoUrl, let url = URL(string: image) {
                eventPhotoImageView.sd_setImage(with: url, completed: nil)
            }
            
            eventNameLabel.text = event.name
            eventPlaceLabel.text = event.place
            eventTimeLabel.text = event.time
            refreshFavouriteButtonIcon(isFavourite: event.isFavourite)
        }
    }
    
    func refreshFavouriteButtonIcon(isFavourite: Bool) {
        favouriteButton.setImage(isFavourite ? UIImage(named: "favourite") : UIImage(named: "unfavourite"), for: .normal)
    }
}
