//
//  PreferencesTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class PreferencesTableViewCell: UITableViewCell {
    
    let userDefaults = UserDefaults.standard
    
    static let identifier = "PreferencesTableViewCell"
    
    
    
    func updateInterfaceStyle() {
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 15.0, *) {
                let windows = window.windows.first
                windows?.overrideUserInterfaceStyle = self.controlSwitch.isOn == true ? .dark : .light
                userDefaults.set(controlSwitch.isOn, forKey: "appearanceSwitchState") // 스위치 상태 저장하기 위해 UserDefaults에 상태 저장
            }
        }
    }
    
    @objc func handleAppearanceChange(_ sender: UISwitch) {
       self.updateInterfaceStyle()
    }
    var controlSwitch: UISwitch = {
        let swicth: UISwitch = UISwitch()
        swicth.tintColor = UIColor.black
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 15.0, *) {
                let windows = window.windows.first
                if windows?.overrideUserInterfaceStyle == .dark {
                    swicth.isOn = true
                }else {
                    swicth.isOn = false
                }
            }
        }
        
        swicth.addTarget(self, action: #selector(handleAppearanceChange), for: .valueChanged)
        return swicth
    }()
    
    let defaults = UserDefaults.standard
    let darkModeSwitchAct = "controlSwitch"
    
    var darkMode = false
    
    @objc func onClickSwitch(sender: UISwitch) {
        
        
    }
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
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
