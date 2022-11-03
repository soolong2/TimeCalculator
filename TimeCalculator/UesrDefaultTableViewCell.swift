//
//  UesrDefaultTableViewCell.swift
//  TimeCalculator
//
//  Created by so on 2022/11/03.
//

import UIKit

class UesrDefaultTableViewCell: UITableViewCell {
   
        static let identifier = "UesrDefaultTableViewCell"
        
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
                make.leading.equalTo(self.safeAreaLayoutGuide)
                make.trailing.equalTo(self.safeAreaLayoutGuide)
                make.top.bottom.equalTo(self.safeAreaLayoutGuide)
            }
        }
    }
