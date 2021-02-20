//
//  OrderList.swift
//  Bot Shop
//
//  Created by Rick Jacobson on 2/19/21.
//

import Foundation
import UIKit

class OrderList: UIViewController {
    
    let tableView = UITableView()
    
    let orders = [
        Order(title: "July 2020", image: UIImage(named: "box")!),
        Order(title: "June 2020", image: UIImage(named: "box")!),
        Order(title: "May 2020", image: UIImage(named: "box")!),
        Order(title: "December 2020", image: UIImage(named: "box")!),
        Order(title: "November 2020", image: UIImage(named: "box")!),
        Order(title: "October 2019", image: UIImage(named: "box")!),
        Order(title: "September 2019", image: UIImage(named: "box")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        // I will never get used to the multitude of things necessary to set up a tableView
        tableView.register(PastOrderCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        setupTableView()
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

}

extension OrderList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PastOrderCell
        // Create a chevron-shaped indicator for each cell to imply the user can touch for more detail
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.setBoxContents(box: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
