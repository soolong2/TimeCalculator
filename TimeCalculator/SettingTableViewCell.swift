//
//  SettingTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    lazy var controlSwitch: UISwitch = {
                     let swicth: UISwitch = UISwitch()
                     // Display the border of Swicth.
                     swicth.tintColor = UIColor.orange
                     // Set Switch to On.
                     swicth.isOn = true
//                      Set the event to be called when switching On / Off of Switch.
//                     swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControlEvents.valueChanged)
                     return swicth
                 }()
    @objc func onClickSwitch(sender: UISwitch) {
                      var text: String!
                      var color: UIColor!
                      if sender.isOn {
                          text = "On"
                          color = UIColor.gray
                      } else {
                          text = "Off"
                          color = UIColor.orange
                      }
//                      self.label.text = text
//                      self.label.backgroundColor = color
                  }
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
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
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
            controlSwitch.snp.makeConstraints { make in
                make.leading.equalTo(title.snp.trailing)
                make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-10)
                make.top.bottom.equalTo(title).offset(5)
            }
            
        }
    }
}
