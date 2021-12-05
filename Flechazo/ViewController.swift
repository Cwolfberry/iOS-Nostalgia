//
//  ViewController.swift
//  Flechazo
//
//  Created by Avalan on 2021/11/20.
//

import UIKit
import SnapKit
import RxSwift
import CloudKit

class ViewController: UIViewController {
    
    let rxBasicModel:RxBasicModel = RxBasicModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI();
    }
    
    
    func setupUI() {
        
        let label = UILabel()
        label.text = "hello, flechazo..."
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.width.equalTo(self.view)
            make.top.equalTo(self.view).offset(300)
            make.height.equalTo(50)
        }
        
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("click", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(label.snp_bottomMargin).offset(80)
            make.size.equalTo(CGSize(width: 80, height: 60))
        }
        
    }
    
    
    
    // MARK: - click event
    @objc func btnClicked() {
        NSLog("btnClicked...")
        // 1. Observalbe
//        testObservable()
        // 2. Subject
//        rxBasicModel.testSubject()
        rxBasicModel.testSubject()
    }

}







