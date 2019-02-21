//
//  AddListControllerSubview.swift
//  todoApp
//
//  Created by Macbook Pro on 2/19/19.
//  Copyright © 2019 pich. All rights reserved.
//

import SnapKit
import Then
import UIKit

class AddListControllerSubview {
    let header = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let todoText = UILabel().then{
        $0.text = "Add a Task List"
    }
    let backBtn = UIButton().then{
        $0.setImage(UIImage(named: "arrows"), for: .normal)
    }
    
    let addNew = UITextField().then{
        $0.placeholder = "Add New Task"
        $0.layer.cornerRadius = 5.0
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.blue.cgColor
        $0.backgroundColor = UIColor.white
    }
    let addBtn = UIButton().then{
        $0.setTitle("Add New", for: .normal)
        $0.backgroundColor = UIColor.brown
        $0.layer.cornerRadius = 5.0
    }
    
    
    func addListUpdateConstraints() {
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalToSuperview()
        }
        self.backBtn.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.top.equalTo(self.header.snp.bottom).offset(-50)
            make.left.equalToSuperview()
        }
        self.todoText.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.header.snp.bottom).offset(-50)
        }
        self.addNew.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.header.snp.bottom)
        }
        self.addBtn.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.addNew.snp.bottom).offset(20)
        }
    }
    
}

