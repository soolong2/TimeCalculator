//
//  CalculatorView.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import UIKit
import SnapKit

class CalculatorView: UIView {
    let oneButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("1", for: .normal)
        return button
    }()
    let twoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.alpha = 20
        button.titleColor(for: .normal)
        button.setTitle("2", for: .normal)
        return button
    }()
    let threeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("3", for: .normal)
        return button
    }()
    let fourButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("4", for: .normal)
        return button
    }()
    let fiveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("5", for: .normal)
        return button
    }()
    let sixButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("6", for: .normal)
        return button
    }()
    let sevenButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("7", for: .normal)
        return button
    }()
    let eightButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("8", for: .normal)
        return button
    }()
    let nineButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("9", for: .normal)
        return button
    }()
    let zeroButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("0", for: .normal)
        return button
    }()
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.tintColor = .systemBackground
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("+", for: .normal)
        return button
    }()
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .systemFont(ofSize: 26)
        button.setTitle("AC", for: .normal)
        return button
    }()
    let resultButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.customAccent, for: .normal)
        button.backgroundColor = .systemGray5
        button.titleLabel?.font = .italicSystemFont(ofSize: 26)
        button.setTitle("=", for: .normal)
        return button
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
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(fiveButton)
        addSubview(sixButton)
        addSubview(sevenButton)
        addSubview(eightButton)
        addSubview(nineButton)
        addSubview(zeroButton)
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(resetButton)
        addSubview(resultButton)
    }
    func setupConstraints() {
        oneButton.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.safeAreaLayoutGuide)
        }
        twoButton.snp.makeConstraints { make in
            make.leading.equalTo(self.oneButton.snp.trailing)
            make.top.equalTo(self.oneButton)
            make.width.height.equalTo(oneButton)
        }
        threeButton.snp.makeConstraints { make in
            make.leading.equalTo(self.twoButton.snp.trailing)
            make.top.equalTo(self.twoButton)
            make.width.height.equalTo(oneButton)
        }
        resetButton.snp.makeConstraints { make in
            make.leading.equalTo(threeButton.snp.trailing)
            make.top.equalTo(threeButton)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.width.height.equalTo(oneButton)
        }
        fourButton.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.oneButton.snp.bottom)
            make.width.height.equalTo(oneButton)
        }
        fiveButton.snp.makeConstraints { make in
            make.leading.equalTo(self.fourButton.snp.trailing)
            make.top.equalTo(self.fourButton)
            make.width.height.equalTo(oneButton)
        }
        sixButton.snp.makeConstraints { make in
            make.leading.equalTo(self.fiveButton.snp.trailing)
            make.top.equalTo(self.fiveButton)
            make.width.height.equalTo(oneButton)
        }
        minusButton.snp.makeConstraints { make in
            make.leading.equalTo(sixButton.snp.trailing)
            make.top.equalTo(self.fourButton)
            make.width.height.equalTo(oneButton)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        sevenButton.snp.makeConstraints { make in
            make.leading.equalTo(self.fourButton)
            make.top.equalTo(fourButton.snp.bottom)
            make.width.height.equalTo(oneButton)
        }
        eightButton.snp.makeConstraints { make in
            make.leading.equalTo(self.sevenButton.snp.trailing)
            make.top.equalTo(self.sevenButton)
            make.width.height.equalTo(oneButton)
        }
        nineButton.snp.makeConstraints { make in
            make.leading.equalTo(self.eightButton.snp.trailing)
            make.top.equalTo(self.eightButton)
            make.width.height.equalTo(oneButton)
        }
        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(self.nineButton.snp.trailing)
            make.top.equalTo(self.nineButton)
            make.width.height.equalTo(oneButton)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        zeroButton.snp.makeConstraints { make in
            make.leading.equalTo(self.sevenButton)
            make.top.equalTo(self.sevenButton.snp.bottom)
            make.trailing.equalTo(self.nineButton)
            make.height.equalTo(oneButton)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        resultButton.snp.makeConstraints { make in
            make.leading.equalTo(self.zeroButton.snp.trailing)
            make.top.equalTo(self.zeroButton)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(zeroButton)
        }
    }
}
extension UIColor {
    static var customAccent: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor(ciColor: .white)
                } else {
                    return UIColor(ciColor: .black)
                }
            }
        } else {
            return UIColor(red: 0.8196078431, green: 0.3568627451, blue: 0.2235294118, alpha: 1.0)
        }
    }
}
