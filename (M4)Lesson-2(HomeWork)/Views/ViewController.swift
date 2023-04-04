//
//  ViewController.swift
//  (M4)Lesson-2(HomeWork)
//
//  Created by Ahmed Muvaza on 4/4/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private lazy var getRequest: UIButton = {
        let get = UIButton(type: .system)
        get .setTitle("GET", for: .normal)
        get.backgroundColor = .red
        get.setTitleColor(.white, for: .normal)
        get.layer.cornerRadius = 5
        get.addTarget(self, action: #selector(getRequest(sender:)), for: .touchUpInside)
        return get
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(getRequest)
        getRequest.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
    }
    
    @objc private func getRequest(sender: UIButton) {
        ApiManager.shared.getRequest { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let vc = GetRequestPage()
                    vc.data = data.articles ?? []
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
