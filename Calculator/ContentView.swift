//
//  ContentView.swift
//  Calculator
//
//  Created by 황승혜 on 4/18/24.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 90, minHeight: 0, maxHeight: 120, alignment: .center)
            .border(Color.gray)
            .font(.title)
    }
}

struct ContentView: View {
    @State var inputStorage: String = "0"
    // 버튼 눌린 문자들을 문자열로 만들고 조건문으로 계산
    
    var body: some View {
        VStack { // 기본 틀(계산식, 버튼)
            // 계산식 출력(
            Spacer()
            HStack{
                Spacer()
                Text(inputStorage)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    
            }

            HStack { // 버튼 첫번째 줄(7, 8, 9, /) 들어갈 스택
                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "7"
                }) {
                    Text("7")
                }
                .buttonStyle(MyButtonStyle())
                
                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "8"
                }) {
                    Text("8")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "9"
                }) {
                    Text("9")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage.last != "0" && inputStorage.last != " " {
                        inputStorage += " / "
                    }
                }) {
                    Text("/")
                }
                .buttonStyle(MyButtonStyle())

            }
            HStack { // 버튼 두번째 줄(4, 5, 6, *) 들어갈 스택
                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "4"
                }) {
                    Text("4")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "5"
                }) {
                    Text("5")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "6"
                }) {
                    Text("6")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage.last != " " {
                        inputStorage += " * "
                    }
                }) {
                    Text("*")
                }
                .buttonStyle(MyButtonStyle())
            }
            HStack { // 버튼 세번째 줄(1, 2, 3, -) 들어갈 스택
                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "1"
                }) {
                    Text("1")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "2"
                }) {
                    Text("2")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage == "0" {
                        inputStorage = ""
                    }
                    inputStorage += "3"
                }) {
                    Text("3")
                }
                .buttonStyle(MyButtonStyle())

                Button(action: {
                    if inputStorage.last != " " {
                        inputStorage += " - "
                    }
                }) {
                    Text("-")
                }
                .buttonStyle(MyButtonStyle())
            }
            HStack { // 버튼 네번째 줄(. 0, C, +) 들어갈 스택
                Button(action: {
                    if inputStorage != "" && inputStorage.last != "." {
                        inputStorage += "."
                    }
                }) {
                    Text(".")
                }
                .buttonStyle(MyButtonStyle())
                
                Button(action: {
                    if inputStorage != "0" {
                        inputStorage += "0"
                    }
                }) {
                    Text("0")
                }
                .buttonStyle(MyButtonStyle())

                Button {
                    inputStorage = "0"
                } label: {
                    Text("C")
                }
                .buttonStyle(MyButtonStyle())
                .foregroundColor(.red)

                Button(action: {
                    if inputStorage.last != " "{
                        inputStorage += " + "
                    }
                }) {
                    Text("+")
                }
                .buttonStyle(MyButtonStyle())
            }
            // 마지막 버튼(=)
            Button {
                if inputStorage.last != "/" || inputStorage.last != "*" || inputStorage.last != "-" || inputStorage.last != "+" {
                    inputStorage = CalculateAll()
                }
            } label: {
                Text("=")
            }
            .frame(width: 360, height: 120)
            .border(Color.gray)
            .foregroundColor(.black)
        }
        .padding()
    }
    
    
    func CalculateAll() -> String {
        // 숫자와 연산자로 나눠 계산하는 함수
        let numbers = inputStorage.split(separator: " ").map(String.init)
        var num1 = Double(numbers[0])
        var operaters = numbers[1]
        var num2 = Double(numbers[2])
        
        if operaters == "+" {
            return String(num1! + num2!)
        }
        else if operaters == "-" {
            return String(num1! - num2!)
        }
        else if operaters == "*" {
            return String(num1! * num2!)
        }
        else if operaters == "/" {
            return String(num1! / num2!)
        }
        
        return "Retry"
    }
}

#Preview {
    ContentView()
}
