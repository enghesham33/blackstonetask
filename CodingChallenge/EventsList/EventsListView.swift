//
//  EventsListView.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit

class EventsListView: BaseView {

    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
        }
    }
    @IBOutlet weak var eventsTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: EventCell.idntifier, bundle: nil)
            eventsTableView.register(nib, forCellReuseIdentifier: EventCell.idntifier)
            
            eventsTableView.dataSource = self
            eventsTableView.delegate = self
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
            eventsTableView.addSubview(refreshControl)
        }
    }
    let refreshControl = UIRefreshControl()
    
    var presenter: EventsListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        searchTextField.text = nil
        presenter?.getEventsList(searchQuery: "")
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.getEventsList(searchQuery: searchTextField.text ?? "")
    }
}

extension EventsListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        presenter?.getEventsList(searchQuery: textField.text ?? "")
        return true
    }
}

extension EventsListView: EventsListViewProtocol {
    
    func reloadData() {
        eventsTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension EventsListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.idntifier, for: indexPath) as! EventCell
        cell.event = presenter?.getItemForRow(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openEventDetails(event: presenter?.getItemForRow(index: indexPath.row), index: indexPath.row, delegate: self)
    }
}

extension EventsListView: EventDetailsDelegate {
    func refreshFavourite(eventIndex: Int, isFavourite: Bool) {
        let cell = eventsTableView.cellForRow(at: IndexPath(row: eventIndex, section: 0)) as? EventCell
        cell?.event.isFavourite = isFavourite
        cell?.populateData()
    }
}
