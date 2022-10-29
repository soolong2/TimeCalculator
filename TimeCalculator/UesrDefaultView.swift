//
//  UesrDefaultView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/28.
//

import UIKit

class UesrDefaultView: UIView {
    var da : [Int] = []
    let oneButton: UIButton = {
    let button = UIButton()
        button.setImage(.init(systemName: "trash"), for: .normal)
        return button
    }()
    let twoButton: UIButton = {
    let button = UIButton()
        button.titleColor(for: .normal)
        button.setImage(.init(systemName: "clear"), for: .normal)
        return button
    }()
    let resultText1: UITableView = {
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
        addSubview(oneButton)
        addSubview(twoButton)
        addSubview(resultText1)
        resultText1.delegate = self
        resultText1.dataSource = self
        resultText1.register(UesrDefaultTableViewCell.self, forCellReuseIdentifier: UesrDefaultTableViewCell.identifier)
    }
    func setupConstraints() {
        oneButton.snp.makeConstraints { make in
            make.top.leading.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(30)
        }
        twoButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(30)
        }
        resultText1.snp.makeConstraints { make in
            make.top.equalTo(oneButton.snp.bottom).offset(20)
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
        return da.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UesrDefaultTableViewCell", for: indexPath) as? UesrDefaultTableViewCell else {return UITableViewCell()}
        cell.title.text = "\(da[indexPath.row])"
        return cell
    }
}
