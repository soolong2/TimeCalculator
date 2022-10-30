//
//  UesrDefaultView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class UesrDefaultView: UIView {
    var currentDispalyValue : [String] = []
    let trashButton: UIButton = {
    let button = UIButton()
        button.setImage(.init(systemName: "trash"), for: .normal)
        return button
    }()
    let clearButton: UIButton = {
    let button = UIButton()
        button.titleColor(for: .normal)
        button.setImage(.init(systemName: "clear"), for: .normal)
        return button
    }()
    let resultTablewView: UITableView = {
        let textFieldView = UITableView()
        textFieldView.backgroundColor = .systemBackground
        return textFieldView
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
        backgroundColor = .white
        addSubview(trashButton)
        addSubview(clearButton)
        addSubview(resultTablewView)
        resultTablewView.delegate = self
        resultTablewView.dataSource = self
        resultTablewView.register(UesrDefaultTableViewCell.self, forCellReuseIdentifier: UesrDefaultTableViewCell.identifier)
    }
    func setupConstraints() {
        trashButton.snp.makeConstraints { make in
            make.top.leading.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(30)
        }
        clearButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(30)
        }
        resultTablewView.snp.makeConstraints { make in
            make.top.equalTo(trashButton.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
extension UesrDefaultView: UITableViewDelegate {
    
}
extension UesrDefaultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currentDispalyValue.count
       return ViewController().UserDefaultsValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UesrDefaultTableViewCell", for: indexPath) as? UesrDefaultTableViewCell else {return UITableViewCell()}
//        cell.UesrDefaultLabel.text = currentDispalyValue[indexPath.row]
        cell.UesrDefaultLabel.text = "\(ViewController().UserDefaultsValue)"
//        tableView.reloadData()
        return cell
        
    }
}
