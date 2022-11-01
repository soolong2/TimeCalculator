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
    let resultView: UIView = {
        let resultView = UIView()
        resultView.backgroundColor = .systemBackground
        return resultView
    }()
    var resultViewLabel: UILabel = {
        let resultViewLabel = UILabel()
        resultViewLabel.backgroundColor = .systemBackground
//        textFieldView.text = "현재시간은??"
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
        backgroundColor = .white
        addSubview(trashButton)
        addSubview(clearButton)
        addSubview(resultView)
        addSubview(resultViewLabel)
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
        resultView.snp.makeConstraints { make in
            make.top.equalTo(trashButton.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        resultViewLabel.snp.makeConstraints { make in
            make.top.equalTo(resultView.snp.top).offset(70)
            make.leading.equalTo(resultView.snp.leading).offset(20)
            make.trailing.equalTo(resultView.snp.trailing).offset(-20)
            make.width.equalTo(50)
        }
    }
}

