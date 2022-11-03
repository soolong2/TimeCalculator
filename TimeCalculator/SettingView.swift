//
//  SettingTableView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit
import SnapKit

class SettingView: UIView {
    let sections: [String] = ["", "환경설정","","","기타"]
    var datasouce = ["광고삭제","구매를복원","프리미엄 버전"]
    var datasouce2 = ["다크테마"]
    var datasouce3 = ["그리드"]
    var datasouce4 = ["키보드사운드"]
    var datasouce5 = ["앱평가","몫","기부","피드백 보내기"]
    
    let settingTablewView : UITableView = {
        let settingTablewView = UITableView()
        settingTablewView.backgroundColor = .systemBackground
        settingTablewView.rowHeight = UITableView.automaticDimension
    
        return settingTablewView
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
        settingTablewView.delegate = self
        settingTablewView.dataSource = self
        settingTablewView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        settingTablewView.register(PreferencesTableViewCell.self, forCellReuseIdentifier: PreferencesTableViewCell.identifier)
        settingTablewView.register(GridTableViewCell.self, forCellReuseIdentifier: GridTableViewCell.identifier)
        settingTablewView.register(SoundTableViewCell.self, forCellReuseIdentifier: SoundTableViewCell.identifier)
        settingTablewView.register(OthersTableViewCell.self, forCellReuseIdentifier: OthersTableViewCell.identifier)
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
        return sections.count
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
        }else if section == 3 {
            return datasouce4.count
        }else if section == 4 {
            return datasouce5.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
            cell.title.text = datasouce[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreferencesTableViewCell", for: indexPath) as? PreferencesTableViewCell else { return UITableViewCell()}
            cell.title.text = datasouce2[indexPath.row]
            return cell
        }else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GridTableViewCell", for: indexPath) as? GridTableViewCell else { return UITableViewCell()}
            cell.title.text = datasouce3[indexPath.row]
            return cell
        }else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SoundTableViewCell", for: indexPath) as? SoundTableViewCell else { return UITableViewCell()}
            cell.title.text = datasouce4[indexPath.row]
            return cell
        }else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OthersTableViewCell", for: indexPath) as? OthersTableViewCell else { return UITableViewCell()}
            cell.title.text = datasouce5[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
