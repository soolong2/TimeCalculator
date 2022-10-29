//
//  SettingViewController.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import UIKit

class SettingViewController: UIViewController {

    var settingLabel: UILabel = {
        let settingLabel = UILabel()
        settingLabel.textColor = .systemBlue
        settingLabel.text = "설정"
        settingLabel.font = .boldSystemFont(ofSize: 20)
        return settingLabel
    }()
    var settingLine: UIView = {
       let settingLine = UIView()
        settingLine.backgroundColor = .systemBlue
        settingLine.layer.cornerRadius = 5
        return settingLine
    }()
    var settingTebleView: SettingView = {
       let settingLine = SettingView()
        settingLine.backgroundColor = .white
        return settingLine
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubView()
    }
    
    func addSubView() {
        view.addSubview(settingLabel)
        view.addSubview(settingLine)
        view.addSubview(settingTebleView)
       
        
        settingLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        settingLine.snp.makeConstraints { make in
            make.top.equalTo(settingLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(10)
        }
        settingTebleView.snp.makeConstraints { make in
            make.top.equalTo(settingLine.snp.bottom).offset(20)
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}
