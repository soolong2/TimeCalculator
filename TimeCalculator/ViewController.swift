//
//  ViewController.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let damodal = UesrDefaultView()
    private var modal: Calculator = Calculator()
    let darkAndLight = PreferencesTableViewCell()
    var displayValue: Int{
        get{
            guard let text = resultText.text else { return 0 }
            return Int(text) ?? 0
        }
        set{
            resultText.text = "\(newValue)"
        }
    }
    
    private var isTypetingDigit: Bool = false
    var calView: CalculatorView = {
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
        view.초기화Button.addTarget(CalculatorView(), action: #selector(초기화ButtonClick), for: .touchUpInside)
        view.계산Button.addTarget(CalculatorView(), action: #selector(계산ButtonClick), for: .touchUpInside)
        view.플러스Button.addTarget(CalculatorView(), action: #selector(플러스ButtonClick), for: .touchUpInside)
        view.마이너스Button.addTarget(CalculatorView(), action: #selector(마이너스ButtonClick), for: .touchUpInside)
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
         view.twoButton.addTarget(self, action: #selector(BackButton), for: .touchUpInside)
         view.backgroundColor = .systemBackground
         view.alpha = 2
         view.isHidden = true
        return view
    }()
    
    let viewReturnButton: UIButton = {
    let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setImage(UIImage(named: "gearshape"), for: .normal)
        return button
    }()
    
     var sample: UIView = {
        let view = UIView()
         view.backgroundColor = .systemBackground
        return view
    }()
    
    let resultText: UILabel = {
        let textFieldView = UILabel()
        textFieldView.backgroundColor = .systemBackground
        textFieldView.text = "00:00"
        return textFieldView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkAndLight.controlSwitch.isOn = darkAndLight.userDefaults.bool(forKey: "appearanceSwitchState")
        darkAndLight.updateInterfaceStyle()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "square.fill.on.square.fill"), style: .done, target: self, action: #selector(nextView1))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .init(systemName: "gearshape"), style: .done, target: self, action: #selector(nextView))
        addSubView()
        
    }
    @objc func nextView1(_ sender: UIBarButtonItem) {
        uesrDefaultView.isHidden = false
    }
    @objc func nextView(_ sender: UIBarButtonItem) {
        let settingView = SettingViewController()
        self.navigationController?.pushViewController(settingView, animated: true)
    }
    func addSubView() {
        view.addSubview(calView)
        view.addSubview(sample)
        view.addSubview(resultText)
        view.addSubview(resultTimeLable)
        view.addSubview(uesrDefaultView)
    
        
        calView.snp.makeConstraints { make in
            make.top.equalTo(self.sample.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        uesrDefaultView.snp.makeConstraints { make in
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
//            make.width.height.equalTo(300)
            make.bottom.equalTo(sample).offset(-100)
            make.trailing.equalTo(sample).offset(-150)
        }
        
        sample.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(uesrDefaultView)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        resultText.snp.makeConstraints { make in
            make.bottom.equalTo(sample.snp.bottom).offset(-30)
            make.trailing.equalTo(sample.snp.trailing).offset(-30)
        }
        resultTimeLable.snp.makeConstraints { make in
            make.bottom.equalTo(resultText.snp.top).offset(-60)
            make.trailing.equalTo(resultText)
        }
       
    }
}

extension ViewController {
    @objc func oneButtonClick() {
        guard let digit = calView.oneButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func twoButtonClick() {
        guard let digit = calView.twoButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func threeButtonClick() {
        guard let digit = calView.threeButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func fourButtonClick() {
        guard let digit = calView.fourButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func fiveButtonClick() {
        guard let digit = calView.fiveButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func sixButtonClick() {
        guard let digit = calView.sixButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func sevenButtonClick() {
        guard let digit = calView.sevenButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func eightButtonClick() {
        guard let digit = calView.eightButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func nineButtonClick() {
        guard let digit = calView.nineButton.currentTitle, let curentText = resultText.text else {
            return
        }
        if isTypetingDigit {
            resultText.text = curentText + digit
        } else {
            resultText.text = digit
        }
        isTypetingDigit = true
    }
    @objc func zeroButtonClick() {
        guard let digit = calView.zeroButton.currentTitle, let curentText = resultText.text else {
            return
        }
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
    @objc func 계산ButtonClick() {
        guard let operation = calView.계산Button.titleLabel?.text else {return
        }
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
        damodal.da.append(displayValue)
        damodal.resultText1.reloadData()
        print(damodal.da)
    }
    @objc func 플러스ButtonClick() {
        guard let operation = calView.플러스Button.titleLabel?.text else {return
        }
        modal.setOperand(operand: Int(displayValue))
        modal.performOperation(symbol: operation)
        displayValue = Int(modal.result)
        isTypetingDigit = false
        damodal.da.append(displayValue)
        damodal.resultText1.reloadData()
        print(damodal.da)
    }
    @objc func 마이너스ButtonClick() {
        guard let operation = calView.마이너스Button.titleLabel?.text else {return
        }
        modal.setOperand(operand: Int(displayValue))
        modal.performOperation(symbol: operation)
        displayValue = modal.result
        isTypetingDigit = false
        damodal.da.append(displayValue)
        damodal.resultText1.reloadData()
        print(damodal.da)
    }
    @objc func BackButton() {
        uesrDefaultView.isHidden = true
        
    }
}

