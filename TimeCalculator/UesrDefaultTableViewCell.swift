//
//  UesrDefaultTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/10/29.
//

import UIKit

class UesrDefaultTableViewCell: UITableViewCell {
    static let identifier = "UesrDefaultTableViewCell"
    var UesrDefaultLabel: UILabel = {
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
        contentView.addSubview(UesrDefaultLabel)
        
        UesrDefaultLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
