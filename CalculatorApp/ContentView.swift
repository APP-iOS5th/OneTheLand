//
//  ContentView.swift
//  CalculatorApp
//
//  Created by 이상민 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "0"
    let buttons = [
        ["7","8","9","/"],
        ["4","5","6","*"],
        ["1","2","3","-"],
        [".","0","C","+"],
    ]
    var body: some View {
        VStack(){
            //입력부분 생성
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: 200, alignment: .bottomTrailing)
                .padding()
                
            
            //키패드 생성
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                ForEach(buttons, id: \.self){ row in
                    GridRow {
                        ForEach(row, id: \.self){ col in
                            KeypadBtn(pad: col, text: $text)
                        }//: LOOP
                    }//: GRIDROW
                }//: LOOP
                KeypadBtn(pad: "=", text: $text)
            }//: GRID
            .padding(10)
            .background(.white)
        }//: VSTACK
        .background(.gray.opacity(0.3))
    }
}

//Keypad Button View Component
struct KeypadBtn: View {
    let pad: String
    @Binding var text: String
    var body: some View {
        Button(action: {
            switch pad{
            case "=":
                calculate1()
            case "C":
                text = "0"
            case "+","-","*","/":
                if text == "0"{
                    text = ""
                }
                if (["+","-","*","/"]).contains(text.suffix(1)){
                    text.removeLast()
                }
                text += pad
            default:
                if text == "0"{
                    text = ""
                }
                text += pad
            }
        }, label: {
            Rectangle()
                .stroke(.black,lineWidth: 1)
                .overlay {
                    Text(pad)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(pad == "C" ? .red : .black)
                }
        })
    }
    
    func calculate(){
        let operators: [Character] = ["+","-","*","/"]
        if operators.contains(text.suffix(1)){
            text = "Invalid Input"
            return
        }
        
        var numbers = [Double]()
        var currentNumber = ""
        var currentOperator = "+"
        
        for char in text{
            print(char)
            if operators.contains(char){
                if let number = Double(currentNumber){
                    switch currentOperator{
                    case "+":
                        numbers.append(number)
                    case "-":
                        numbers.append(-number)
                    case "*":
                        numbers[numbers.count - 1] *= number
                    case "/":
                        numbers[numbers.count - 1] /= number
                    default:
                        break
                    }
                    currentNumber = ""
                    currentOperator = String(char)
                }
                
            }else{
                currentNumber += String(char)
            }
        }
        
        if !currentNumber.isEmpty{
            if let number = Double(currentNumber){
                switch currentOperator{
                case "+":
                    numbers.append(number)
                case "-":
                    numbers.append(-number)
                case "*":
                    numbers[numbers.count - 1] *= number
                case "/":
                    numbers[numbers.count - 1] /= number
                default:
                    break
                }
            }
        }
        text = String(numbers.reduce(0, +))
    }
    
    func calculate1(){
        let expression = NSExpression(format: text)
        if let value = expression.expressionValue(with: nil, context: nil) as? Double{
            text = String(value)
        }else{
            text = "Invalid input"
        }
    }
}

#Preview {
    ContentView()
}
