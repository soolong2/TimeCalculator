//
//  ViewController.swift
//  TimeCalculator
//
//  Created by so on 2022/10/27.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let uesrdefulatView = UesrDefaultView()
    let darkAndLight = PreferencesTableViewCell()
    let defaults = UserDefaults.standard
    var UserDefaultsValue = UserDefaults.standard.integer(forKey: "UserDefaultsValue")
    
    private lazy var displayNumber = ""
    private lazy var firstOperand = ""
    private lazy var secondOperand = ""
    private lazy var result = ""
    private lazy var currentOperation: Operation = .unknown
    
    lazy var formula = ""                // 계산식 담는 문자열
    private lazy var isClickedOperation = false  // 연산자 버튼이 눌렸는지
    private lazy var isClickedEqual = false      // = 기호 눌렀는지
    private lazy var isAddedFormula = false      // secondOperand를 formula에 넣었는지
    
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
        view.resetButton.addTarget(CalculatorView(), action: #selector(resetButtonClick), for: .touchUpInside)
        view.resultButton.addTarget(CalculatorView(), action: #selector(resultButtonClick), for: .touchUpInside)
        view.plusButton.addTarget(CalculatorView(), action: #selector(plusButtonClick), for: .touchUpInside)
        view.minusButton.addTarget(CalculatorView(), action: #selector(minusButtonClick), for: .touchUpInside)
        return view
    }()
    var resultTimeLable: UILabel = {
        let resultTimeLable = UILabel()
        resultTimeLable.backgroundColor = .systemBackground
        resultTimeLable.text = "현재시간은??"
        return resultTimeLable
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
    let squarefilButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "square.fill.on.square.fill", withConfiguration: imageConfig)
        button.backgroundColor = .systemBackground
        button.setImage(image, for: .normal)
        return button
    }()
    let gearshapeButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "gearshape", withConfiguration: imageConfig)
        button.backgroundColor = .systemBackground
        button.setImage(image, for: .normal)
        return button
    }()
    var labelView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    let resultText: UILabel = {
        let resultText = UILabel()
        resultText.backgroundColor = .systemBackground
        resultText.text = "00:00"
        return resultText
    }()
    var symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.backgroundColor = .systemBackground
        //        symbolLabel.text = "기호는?????"
        return symbolLabel
    }()
    enum Operation {
        case add
        case subtract
        case unknown
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        darkAndLight.controlSwitch.isOn = darkAndLight.userDefaults.bool(forKey: "appearanceSwitchState")
        darkAndLight.updateInterfaceStyle()
        view.backgroundColor = .systemBackground
        self.gearshapeButton.addTarget(self, action: #selector(nextSettingView), for: .touchUpInside)
        self.squarefilButton.addTarget(self, action: #selector(defaultView), for: .touchUpInside)
        addSubView()
        
    }
    @objc func defaultView(_ sender: UIBarButtonItem) {
        uesrDefaultView.isHidden = false
        self.squarefilButton.isHidden = true
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
        view.addSubview(gearshapeButton)
        view.addSubview(squarefilButton)
        view.addSubview(symbolLabel)
        
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
        gearshapeButton.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.top).offset(5)
            make.trailing.equalTo(labelView.snp.trailing).offset(-10)
        }
        squarefilButton.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.top).offset(5)
            make.leading.equalTo(labelView.snp.leading).offset(5)
        }
        resultText.snp.makeConstraints { make in
            make.bottom.equalTo(labelView.snp.bottom).offset(-30)
            make.trailing.equalTo(labelView.snp.trailing).offset(-30)
        }
        resultTimeLable.snp.makeConstraints { make in
            make.bottom.equalTo(resultText.snp.top).offset(-60)
            make.trailing.equalTo(resultText)
        }
        symbolLabel.snp.makeConstraints { make in
            make.top.equalTo(resultText.snp.top)
            make.trailing.equalTo(resultText.snp.leading).offset(-10)
        }
    }
}
extension MainViewController {
    @objc func oneButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.oneButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func twoButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.twoButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func threeButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.threeButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func fourButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.fourButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func fiveButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.fiveButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func sixButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.sixButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func sevenButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.sevenButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func eightButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.eightButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func nineButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.nineButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func zeroButtonClick() {
        createCorrectFormula()
        guard let numberValue = calculatorView.zeroButton.title(for: .normal) else { return }
        if displayNumber.count < 8 {
            displayNumber += numberValue
            resultText.text = updateLabel(displayNumber)
        }
    }
    @objc func resetButtonClick() {
        displayNumber = ""
        firstOperand = ""
        secondOperand = ""
        symbolLabel.text = ""
        result = ""
        currentOperation = .unknown
        resultText.text = "0:00"
        isClickedOperation = false
        isClickedEqual = false
        formula = ""
        
    }
    @objc func resultButtonClick() {
        symbolLabel.text = ""
        self.operation(currentOperation)
        isClickedEqual = true
        isClickedOperation = false
        
        // 계산 기록하기 : 계산식이 담긴 문자열(연산식 + "=" + 결과값)을 UserDefaults에 저장하기
        // formula가 "0:00 = 0:00"이면 저장하지 않기
        // ex) 4:16 + 1:09 + 0:37 = 6:02
        formula += "\(updateLabel(secondOperand)) = \(resultText.text!)"
        
        if formula != "0:00 = 0:00" {
            var history = UserDefaults.standard.array(forKey: "History") as? [String]
            
            if history == nil {
                history = [formula]
                uesrdefulatView.resultTableView.reloadData()
            } else {
                history?.append(formula)
                uesrdefulatView.resultTableView.reloadData()
            }
            UserDefaults.standard.set(history!, forKey: "History")
            uesrdefulatView.resultTableView.reloadData()
            
        }
        formula = ""
        uesrdefulatView.resultTableView.reloadData()
        
    }
    @objc func plusButtonClick() {
        symbolLabel.text = "+"
        operation(.add)
        isAddedFormula = false
    }
    @objc func minusButtonClick() {
        symbolLabel.text = "-"
        operation(.subtract)
        isAddedFormula = false
        
    }
    @objc func BackButton() {
        uesrDefaultView.isHidden = true
        self.squarefilButton.isHidden = false
    }
    @objc func deleteButton() {
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니요", style: .cancel,handler: nil))
        alert.addAction(UIAlertAction(title: "예", style: .default,handler: { _ in
            UserDefaults.standard.removeObject(forKey: "History")
            self.uesrdefulatView.resultTableView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func updateLabel(_ value: String) -> String {
        let value = value.map { String($0) }
        switch value.count {
        case 0: return "0:00"
        case 1: return "0:0\(value[0])"
        case 2: return "0:\(value.joined())"
        case 3: return "\(value[0]):\(value[1...2].joined())"
        case 4: return "\(value[0...1].joined()):\(value[2...3].joined())"
        case 5: return "\(value[0...2].joined()):\(value[3...4].joined())"
        case 6: return "\(value[0]).\(value[1...3].joined()):\(value[4...5].joined())"
        case 7: return "\(value[0...1].joined())\(value[2...4].joined()):\(value[5...6].joined())"
        case 8: return "\(value[0...3].joined())\(value[4...5].joined()):\(value[6...7].joined())"
        default: return ""
        }
    }
    func createCorrectFormula() {
        if isClickedOperation {    // +나 -연산자 누른적 있으면
            // 첫번째 연산자 가져오는 경우 : 두번째 연산자가 없을 때, = 기호 누른 후 추가로 연산할 때
            if secondOperand.isEmpty || isClickedEqual {
                formula = updateLabel(firstOperand)
                switch currentOperation {
                case .add:
                    formula += " + "
                case .subtract:
                    formula += " - "
                default:
                    break
                }
            } else {
                // secondOperand를 이미 formula에 넣은 경우는 다시 넣지 않도록
                if !isAddedFormula {
                    formula += updateLabel(secondOperand)
                    switch currentOperation {
                    case .add:
                        formula += " + "
                    case .subtract:
                        formula += " - "
                    default:
                        break
                    }
                    isAddedFormula = true
                }
            }
        } else {    // +나 -연산자 누른적은 없지만 =연산자 누른적 있으면
            if isClickedEqual {
                firstOperand = ""
                secondOperand = ""
                currentOperation = .unknown
                isClickedEqual = false
            }
        }
    }
    func operation(_ operation: Operation) {
        isClickedOperation = true
        displayNumber = convertTimeFormat(displayNumber.map { String($0) })
        
        if currentOperation != .unknown {
            // 두번째 이상으로 연산기호 눌렀을 때
            if !displayNumber.isEmpty {
                secondOperand = displayNumber
                displayNumber = ""
                
                guard let firstOperand = Int(self.firstOperand) else { return }
                guard let secondOperand = Int(self.secondOperand) else { return }
                
                // 연산 실시
                switch self.currentOperation {
                case .add:
                    // 둘다 분이 두자리고 두 합이 100이 넘으면 40 더하기
                    let firstMin = self.firstOperand.suffix(2)
                    let secondMin = self.secondOperand.suffix(2)
                    
                    if firstMin.count == 2 && secondMin.count == 2 && (Int(firstMin)! + Int(secondMin)!) > 99 {
                        result = "\(firstOperand + secondOperand + 40)"
                    } else {
                        result = "\(firstOperand + secondOperand)"
                    }
                    
                case .subtract:
                    result = String(minusOperation(self.firstOperand, self.secondOperand))
                    
                default:
                    break
                }
                
                result = convertTimeFormat(result.map { String($0) })
                self.firstOperand = result
                resultText.text = updateLabel(result)
            }
            
            currentOperation = operation
        } else {
            // 처음으로 연산기호 눌렀을 때
            resultText.text = updateLabel(displayNumber)
            firstOperand = self.displayNumber
            currentOperation = operation
            displayNumber = ""
        }
    }
    func convertTimeFormat(_ value: [String]) -> String {
        // 시간 포맷에 맞추기 (분이 60에서 99사이라면 60을 뺀 값을 분에 적고 시에 +1 해주기)
        // 두글자 이상일 때 [6, 1] 뒤에서 두글자 가져오기
        if value.count > 1 {
            let lastIndex = value.lastIndex(of: value.last!)!
            var operandMinute = Int(value[lastIndex - 1 ... lastIndex].joined())!
            
            if operandMinute > 59 {
                var operandHour = 0
                
                if value.count > 2 {
                    operandHour = Int(value[0...lastIndex - 2].joined())!
                }
                operandHour += 1
                operandMinute -= 60
                return "\(operandHour)\(String(format: "%02d", operandMinute))"
            }
        }
        return value.joined()
    }
    func minusOperation(_ firstOperand: String, _ secondOperand: String) -> Int {
        // operand가 3자리 이상이고, operand의 분이 input 분보다 작을 때 무조건 -40
        var result = 0
        let firstOperand = firstOperand.map { String($0) }
        let secondOperand = secondOperand.map { String($0) }
        
        if firstOperand.count > 2 {
            let operandLastIndex = firstOperand.lastIndex(of: firstOperand.last!)!
            let operandMinute = Int(firstOperand[operandLastIndex - 1 ... operandLastIndex].joined())!
            
            let inputLastIndex = secondOperand.lastIndex(of: secondOperand.last ?? "0") ?? 0
            var inputMinute = 0
            
            if secondOperand.count > 1 {
                inputMinute = Int(secondOperand[inputLastIndex - 1 ... inputLastIndex].joined())!
            } else {
                inputMinute = Int(secondOperand.joined()) ?? 0
            }
            if operandMinute < inputMinute {
                result = Int(firstOperand.joined())! - (Int(secondOperand.joined()) ?? 0) - 40
            } else {
                result = Int(firstOperand.joined())! - (Int(secondOperand.joined()) ?? 0)
            }
        } else {
            result = Int(firstOperand.joined())! - (Int(secondOperand.joined()) ?? 0)
        }
        
        if result < 0 {
            result = Int(secondOperand.joined())!
        }
        
        return result
    }
}
