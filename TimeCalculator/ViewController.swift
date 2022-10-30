//
//  ViewController.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let uesrdefulatView = UesrDefaultView()
    private var modal: Calculator = Calculator()
    let darkAndLight = PreferencesTableViewCell()
    let defaults = UserDefaults.standard
    var UserDefaultsValue = UserDefaults.standard.integer(forKey: "UserDefaultsValue")
    var displayValue: Int{
        get{
            guard let text = resultText.text else { return 0 }
            return Int(text) ?? 0
        }
        set{
            resultText.text = "\(newValue)"
         defaults.set(displayValue, forKey: "UserDefaultsValue")
            self.UserDefaultsValue = UserDefaults.standard.integer(forKey: "UserDefaultsValue")
            uesrDefaultView.test.text = "저장된값은??\(UserDefaultsValue)"
            
            guard let digit = calculatorView.plusButton.currentTitle, let curentText = uesrDefaultView.test.text else { return }
                if isTypetingDigit {
                    uesrDefaultView.test.text = curentText + digit
                } else {
                    uesrDefaultView.test.text = digit
                }
                isTypetingDigit = true

            
        }
    }
    var isTypetingDigit: Bool = false
    
    var calculatorView: CalculatorView = {
        let view = CalculatorView()
        view.backgroundColor = .systemBackground
        view.oneButton.addTarget(CalculatorView(), action: #selector(oneButtonClick), for: .touchUpInside)
        view.twoButton.addTarget(CalculatorView(), action: #selector(twoButtonClick), for: .touchUpInside)
        view.threeButton.addTarget(CalculatorView(), action: #selector(threeButtonClick), for: .touchUpInside)
        view.fourButton.addTarget(CalculatorView(), action: #selector(fourButtonClick), for: .touchUpInside)
        view.fiveButton.addTarget(CalculatorView(), action: #selector(fiveButtonClick), for: .touchUpInside)
        view.sixButton.addTarget(CalculatorView(), action: #selector(sixButtonClick), for: .touchUpInside)
        view.sevenButton.addTarget(CalculatorView(), action: #selector(sevenButtonClick), for: .touchUpInside)
        view.eightButton.addTarget(CalculatorView(), action: #selector(eightButtonClick), for: .touchUpInside)
        view.nineButton.addTarget(CalculatorView(), action: #selector(nineButtonClick), for: .touchUpInside)
        view.zeroButton.addTarget(CalculatorView(), action: #selector(zeroButtonClick), for: .touchUpInside)
        view.resetButton.addTarget(CalculatorView(), action: #selector(초기화ButtonClick), for: .touchUpInside)
        view.resultButton.addTarget(CalculatorView(), action: #selector(resetButtonClick), for: .touchUpInside)
        view.plusButton.addTarget(CalculatorView(), action: #selector(plusButtonClick), for: .touchUpInside)
        view.minusButton.addTarget(CalculatorView(), action: #selector(minusButtonClick), for: .touchUpInside)
        return view
    }()
    
    var resultTimeLable: UILabel = {
        let textFieldView = UILabel()
        textFieldView.backgroundColor = .systemBackground
        textFieldView.text = "현재시간은??"
        return textFieldView
    }()
    
    var uesrDefaultView: UesrDefaultView = {
        let view = UesrDefaultView()
        view.clearButton.addTarget(self, action: #selector(BackButton), for: .touchUpInside)
        view.trashButton.addTarget(self, action: #selector(deleteButton), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        view.isHidden = true
        return view
    }()
    
    let viewReturnButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setImage(UIImage(named: "gearshape"), for: .normal)
        return button
    }()
    
    var labelView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let resultText: UILabel = {
        let resultTextLabel = UILabel()
        resultTextLabel.backgroundColor = .systemBackground
        resultTextLabel.text = "00:00"
        return resultTextLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkAndLight.controlSwitch.isOn = darkAndLight.userDefaults.bool(forKey: "appearanceSwitchState")
        darkAndLight.updateInterfaceStyle()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "square.fill.on.square.fill"), style: .done, target: self, action: #selector(DefaultView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .init(systemName: "gearshape"), style: .done, target: self, action: #selector(nextSettingView))
        addSubView()
        uesrDefaultView.test.text = "저장된값은??\(UserDefaultsValue)"
        print(UserDefaultsValue)
        
    }
    @objc func DefaultView(_ sender: UIBarButtonItem) {
        uesrDefaultView.isHidden = false
    }
    @objc func nextSettingView(_ sender: UIBarButtonItem) {
        let settingView = SettingViewController()
        self.navigationController?.pushViewController(settingView, animated: true)
    }
    func addSubView() {
        view.addSubview(calculatorView)
        view.addSubview(labelView)
        view.addSubview(resultText)
        view.addSubview(resultTimeLable)
        view.addSubview(uesrDefaultView)
        
        calculatorView.snp.makeConstraints { make in
            make.top.equalTo(self.labelView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.view)
            make.height.equalTo(200)
        }
        uesrDefaultView.snp.makeConstraints { make in
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(labelView).offset(-100)
            make.trailing.equalTo(labelView).offset(-150)
        }
        labelView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(uesrDefaultView)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        resultText.snp.makeConstraints { make in
            make.bottom.equalTo(labelView.snp.bottom).offset(-30)
            make.trailing.equalTo(labelView.snp.trailing).offset(-30)
        }
        resultTimeLable.snp.makeConstraints { make in
            make.bottom.equalTo(resultText.snp.top).offset(-60)
            make.trailing.equalTo(resultText)
        }
    }
}
extension ViewController {
    @objc func oneButtonClick() {
        guard let digit = calculatorView.oneButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func twoButtonClick() {
        guard let digit = calculatorView.twoButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func threeButtonClick() {
        guard let digit = calculatorView.threeButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func fourButtonClick() {
        guard let digit = calculatorView.fourButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func fiveButtonClick() {
        guard let digit = calculatorView.fiveButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func sixButtonClick() {
        guard let digit = calculatorView.sixButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func sevenButtonClick() {
        guard let digit = calculatorView.sevenButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func eightButtonClick() {
        guard let digit = calculatorView.eightButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func nineButtonClick() {
        guard let digit = calculatorView.nineButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func zeroButtonClick() {
        guard let digit = calculatorView.zeroButton.currentTitle, let curentText = resultText.text else { return }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func 초기화ButtonClick() {
        if isTypetingDigit {
            resultText.text = "0"
            resultTimeLable.text = "현재시간은??"
        } else {
            resultText.text = "0"
            resultTimeLable.text = "현재시간은??"
        }
        isTypetingDigit = true
    }
    @objc func resetButtonClick() {
        guard let operation = calculatorView.resultButton.titleLabel?.text else { return }
        let interval = displayValue
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .full
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        resultTimeLable.text = formattedString
        modal.setOperand(operand: Int(displayValue))
        modal.performOperation(symbol: operation)
        displayValue = Int(modal.result)
        isTypetingDigit = false
        uesrdefulatView.currentDispalyValue.append("\(displayValue)")
//        uesrdefulatView.resultTablewView.reloadData()
        print(uesrdefulatView.currentDispalyValue)
    }
    @objc func plusButtonClick() {
        guard let operation = calculatorView.plusButton.titleLabel?.text else { return }
        modal.setOperand(operand: Int(displayValue))
        modal.performOperation(symbol: operation)
        displayValue = Int(modal.result)
        isTypetingDigit = false
        uesrdefulatView.currentDispalyValue.append("\(displayValue)")
//        uesrdefulatView.resultTablewView.reloadData()
        print(uesrdefulatView.currentDispalyValue)
    }
    @objc func minusButtonClick() {
        guard let operation = calculatorView.minusButton.titleLabel?.text else { return }
        modal.setOperand(operand: Int(displayValue))
        modal.performOperation(symbol: operation)
        displayValue = modal.result
        isTypetingDigit = false
        uesrdefulatView.currentDispalyValue.append("\(displayValue)")
//        uesrdefulatView.resultTablewView.reloadData()
        print(uesrdefulatView.currentDispalyValue)
    }
    @objc func BackButton() {
        uesrDefaultView.isHidden = true
    }
    @objc func deleteButton() {
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니요", style: .cancel,handler: nil))
        alert.addAction(UIAlertAction(title: "예", style: .default,handler: { _ in
            UserDefaults.standard.removeObject(forKey: "UserDefaultsValue")
        }))
        self.present(alert, animated: true, completion: nil)
      
    }
    
}

