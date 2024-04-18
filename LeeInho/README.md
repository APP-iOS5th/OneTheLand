# 계산식을 문자열 분할로 직접 계산해보기

## splitExpressionByOperator
문자열 계산식을 원하는 연산자 기호로 잘라서 배열로 반환합니다.

예시:

```
func splitExpressionByOperator(_ expression: String, _ operatorSymbols: String) ->[String] {
    return expression.components(separatedBy: CharacterSet(charactersIn: operatorSymbols))
}

// expression: "1+2*7-2/5", operatorSymbols: "+-"
// 반환값: ["1", "2*7", "2/5"]
let result1 = splitExpressionByOperator("1+2*7-2/5", "+-")

// expression: "2*7*5", operatorSymbols: "*/"
// 반환값: ["2", "7", "5"]
let result2 = splitExpressionByOperator("2*7*5", "*/")
```


## getOperators
문자열 계산식을 자른 연산자를 담는 배열을 반환합니다.

예시:

```
func getOperators(_ expression: String, _ operatorSymbols: String) -> [Character] {
    return expression.map { $0 }.filter { operatorSymbols.contains($0) }
}

// expression: "1+2*7-2/5", operatorSymbols: "+-"
// 반환값: ["+", "-"]
let result1 = getOperators("1+2*7-2/5", "+-")

// expression: "2*7*5", operatorSymbols: "*/"
// 반환값: ["*", "*"]
let result2 = getOperators("2*7*5", "*/")
```

## 계산
```
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
```