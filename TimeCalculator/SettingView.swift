//
//  SettingTableView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit
import SnapKit

class SettingView: UIView {
    private let sections: [String] = ["", "환경설정","기타"]
    var datasouce = ["광고삭제","구매를복원","프리미엄 버전"]
    var datasouce2 = ["다크테마","그리드","키보드사운드"]
    var datasouce3 = ["앱평가","몫","기부","피드백 보내기"]
    
    
    let settingTablewView : UITableView = {
        let tableView = UITableView()
        //        tableView.allowsSelection = false
        tableView.backgroundColor = .white
        tableView.alpha = 0.7
        //        tableView.separatorStyle = .none
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        //        tableView.register(PreferencesTableViewCell.self, forCellReuseIdentifier: PreferencesTableViewCell.identifier)
        //        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        settingTablewView.dataSource = self
        settingTablewView.delegate = self
        
    }
    
    func setupConstraints() {
        addSubview(settingTablewView)
        settingTablewView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

extension SettingView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
extension SettingView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return datasouce.count
        }else if section == 1 {
            return datasouce2.count
        }else if section == 2 {
            return datasouce3.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
        if indexPath.section == 0 {
            cell.title.text = datasouce[indexPath.row]
            //                              cell.textLabel?.text = "\(datasouce[indexPath.row])"
            cell.controlSwitch.isHidden = true
        } else if indexPath.section == 1 {
            cell.title.text = datasouce2[indexPath.row]
            //                              cell.textLabel?.text = "\(datasouce2[indexPath.row])"
            cell.controlSwitch.isSelected = true
        } else if indexPath.section == 2 {
            cell.title.text = datasouce3[indexPath.row]
            cell.controlSwitch.isHidden = true
            cell.controlSwitch.isSelected = true
        }
        else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    //        if indexPath.section == 0 {
    //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
    //            cell.title.text = datasouce[indexPath.row]
    //            return cell
    //        } else if indexPath.section == 1 {
    //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreferencesTableViewCell", for: indexPath) as? PreferencesTableViewCell else {return UITableViewCell()}
    //            cell.title.text = datasouce2[indexPath.row]
    //        }else if indexPath.section == 2 {
    //            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
    //            cell.title.text = datasouce2[indexPath.row]
    //        }
    //        return UITableViewCell()
    //    }
    
    
}
