//
//  SoundTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/31.
//

import UIKit

class SoundTableViewCell: UITableViewCell {
    
    
    let userDefaults = UserDefaults.standard
    
    static let identifier = "SoundTableViewCell"
    let defaults = UserDefaults.standard
    let darkModeSwitchAct = "controlSwitch"
    
    var title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 18)
        return title
    }()
    var controlSwitch: UISwitch = {
        let swicth: UISwitch = UISwitch()
        swicth.tintColor = UIColor.black
        return swicth
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    private func addContentView() {
        contentView.addSubview(title)
        contentView.addSubview(controlSwitch)
        title.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(15)
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        controlSwitch.snp.makeConstraints { make in
            make.top.bottom.equalTo(title).offset(5)
            make.leading.equalTo(title.snp.trailing)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-10)
        }
    }
}
