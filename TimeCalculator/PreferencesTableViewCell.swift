//
//  PreferencesTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class PreferencesTableViewCell: UITableViewCell {

    static let identifier = "PreferencesTableViewCell"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "광고 삭제"
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
        
     
        title.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
            
        }
    }
}
