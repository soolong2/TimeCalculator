//
//  OthersTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit


class OthersTableViewCell: UITableViewCell {
    static let identifier = "OthersTableViewCell"
    
    var title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 18)
        return title
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
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
