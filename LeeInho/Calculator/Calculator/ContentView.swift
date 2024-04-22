//
//  ContentView.swift
//  Calculator
//
//  Created by 이인호 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    let buttons = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        [".", "0", "C", "+"],
        ["="]
    ]
    @State var inputValue: String = "0"
    
    var body: some View {
        VStack {
            Text(inputValue)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 40))
                .padding()
                .background(.gray.opacity(0.5))
            
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonChar in
                        Button(action: {
                            buttonTapped(buttonChar)
                        }) {
                            Text(buttonChar)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .font(.system(size: 28))
                                .foregroundStyle(buttonChar == "C" ? .red : .black)
                                .border(.gray)
                        }
                    }
                }
            }
        }
    }
    
    func buttonTapped(_ button: String) {
        if inputValue == "0" {
            inputValue = ""
        }
        
        switch button {
        case "=":
            if inputValue == "" {
                inputValue = "0"
                return
            }
            
            if let value = evaluateExpression(inputValue) {
                inputValue = String(value)
            } else {
                inputValue = "Error"
                return
            }
        case "C":
            inputValue = "0"
        case "+", "-", "*", "/":
            if ["+", "-", "*", "/"].contains(inputValue.suffix(1)) {
                inputValue.removeLast()
            }
            inputValue += button
        default:
            inputValue += button
        }
    }
    
    func evaluateExpression(_ expression: String) -> Double? {
        let splitByAddSub = splitExpressionByOperator(expression, "+-")
        let addSubOperators = getOperators(expression, "+-")
        var tempResults: [Double] = []

        // 곱셈, 나눗셈 계산 먼저
        for token in splitByAddSub {
            let splitByMulDiv = splitExpressionByOperator(token, "*/")
            let mulDivOperators = getOperators(token, "*/")
            
            guard var tempResult = Double(splitByMulDiv[0]) else {
                return nil
            }
            
            for i in 1..<splitByMulDiv.count {
                if let number = Double(splitByMulDiv[i]) {
                    tempResult = calculate(mulDivOperators[i-1], tempResult, number)
                } else {
                    return nil
                }
            }
                
            tempResults.append(tempResult)
        }
        
        // 덧셈, 뺄셈 계산
        var result = tempResults[0]
        
        for i in 1..<tempResults.count {
            result = calculate(addSubOperators[i-1], result, tempResults[i])
        }
        
        return result
    }
    
    // 문자열 계산식을 원하는 operator로 잘라서 배열로 리턴해줌. ex) expression: "1+2*7-2/5", operatorSymbols: "+-" -> ["1", "2*7", "2/5"]
    // expression: "2*7*5", operatorSymbols: "*/" -> ["2", "7", "5"]
    // 곱셈, 나눗셈이 항상 먼저 계산되기 때문에 우선 +-로 나눈 후 계산
    func splitExpressionByOperator(_ expression: String, _ operatorSymbols: String) -> [String] {
        return expression.components(separatedBy: CharacterSet(charactersIn: operatorSymbols))
    }
    
    // 문자열 계산식을 자른 operator를 담는 배열. expression: "1+2*7-2/5", operatorSymbols: "+-" -> ["+", "-"]
    // expression: "2*7*5", operatorSymbols: "*/" -> ["*", "*"]
    func getOperators(_ expression: String, _ operatorSymbols: String) -> [Character] {
        return expression.map { $0 }.filter { operatorSymbols.contains($0) }
    }

    func calculate(_ calOperator: Character, _ number1: Double, _ number2: Double) -> Double {
        var result: Double = 0

        if calOperator == "+" {
            result = number1 + number2
        } else if calOperator == "-" {
            result = number1 - number2
        } else if calOperator == "*" {
            result = number1 * number2
        } else if calOperator == "/" {
            if number2 != 0 {
                result = number1 / number2
            } else {
                print("Error: Division by zero")
            }
        }
        
        return result
    }

}

#Preview {
    ContentView()
}
