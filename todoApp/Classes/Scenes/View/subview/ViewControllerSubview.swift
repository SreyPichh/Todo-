//
//  ViewControllerSubview.swift
//  todoApp
//
//  Created by Macbook Pro on 2/18/19.
//  Copyright © 2019 pich. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ViewControllerSubview: UIViewController {
    let header = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let todoText = UILabel().then{
        $0.text = "Task Lists"
    }
    let editBtn = UIButton().then{
        $0.setTitle("Edit", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
    }
    lazy var plusBtn = UIButton().then{
        $0.setImage(UIImage(named: "plus"), for: .normal)
    }
    let list = UITableView()
    
    
    func updateConstraints() {
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalToSuperview()
        }
        self.editBtn.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.top.equalTo(self.header.snp.bottom).offset(-50)
            make.left.equalToSuperview().offset(20)
        }
        self.todoText.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.header.snp.bottom).offset(-50)
        }
        self.plusBtn.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.header.snp.bottom).offset(-50)
            make.right.equalToSuperview().offset(-20)
        }
        self.list.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(self.header.snp.bottom)
        }
    }
    
}

//extension ViewControllerSubview {
//    @objc func plusBtnClicked(){
//        print("Add New list button clicked")
//        self.present(AddListController(), animated: true, completion: nil)
//    }
//}
