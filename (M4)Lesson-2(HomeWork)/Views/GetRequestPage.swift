//
//  GetRequestPage.swift
//  (M4)Lesson-2(HomeWork)
//
//  Created by Ahmed Muvaza on 4/4/23.
//

//import Foundation
import UIKit
import SnapKit
import Kingfisher

class GetRequestPage: UIViewController {
    var data: [Article] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some News"
        setupTableViewConfigue()
        setupViewsConstraints()
    }
    
    private func setupTableViewConfigue() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.idCell)
        tableView.reloadData()
    }
    
    private func setupViewsConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GetRequestPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.idCell) as? CustomCell
        
        let value = data[indexPath.row]
        cell?.configure(with: value)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        vc.item = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

