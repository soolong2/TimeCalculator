//
//  UesrDefaultView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class UesrDefaultView: UIView {
    var data  = UserDefaults.standard.array(forKey: "History") as? [String]
    let trashButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "trash", withConfiguration: imageConfig)
        button.backgroundColor = .systemBackground
        button.setImage(image, for: .normal)
        return button
    }()
    let clearButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "clear", withConfiguration: imageConfig)
        button.backgroundColor = .systemBackground
        button.setImage(image, for: .normal)
        return button
    }()
    let resultTableView: UITableView = {
        let resultView = UITableView()
        resultView.backgroundColor = .systemBackground
        return resultView
    }()
    var resultViewLabel: UILabel = {
        let resultViewLabel = UILabel()
        resultViewLabel.backgroundColor = .systemBackground
        resultViewLabel.numberOfLines = 0
        return resultViewLabel
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
        resultTableView.dataSource = self
        resultTableView.register(UesrDefaultTableViewCell.self, forCellReuseIdentifier: UesrDefaultTableViewCell.identifier)
        
        addSubview(trashButton)
        addSubview(clearButton)
        addSubview(resultTableView)
    }
    func setupConstraints() {
        trashButton.snp.makeConstraints { make in
            make.top.leading.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(30)
        }
        clearButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(30)
        }
        resultTableView.snp.makeConstraints { make in
            make.top.equalTo(trashButton.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
extension UesrDefaultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UesrDefaultTableViewCell", for: indexPath) as? UesrDefaultTableViewCell else {return UITableViewCell()}
        cell.title.text = data?[indexPath.row]
        return cell
    }
}
