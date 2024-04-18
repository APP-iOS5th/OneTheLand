//
//  ContentView.swift
//  CalculatorApp
//
//  Created by 이상민 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "3"
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
                GridRow {
                    KeypadBtn(pad: "7", text: $text)
                    KeypadBtn(pad: "8", text: $text)
                    KeypadBtn(pad: "9", text: $text)
                    KeypadBtn(pad: "/", text: $text)
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: "4", text: $text)
                    KeypadBtn(pad: "5", text: $text)
                    KeypadBtn(pad: "6", text: $text)
                    KeypadBtn(pad: "*", text: $text)
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: "1", text: $text)
                    KeypadBtn(pad: "2", text: $text)
                    KeypadBtn(pad: "3", text: $text)
                    KeypadBtn(pad: "-", text: $text)
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: ".", text: $text)
                    KeypadBtn(pad: "0", text: $text)
                    KeypadBtn(pad: "C", text: $text)
                    KeypadBtn(pad: "+", text: $text)
                }//: GRIDROW
                KeypadBtn(pad: "=", text: $text)
            }//: GRID
            .padding(.vertical, 10)
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
                calculate()
            case "C":
                text = ""
            default:
                text += pad
            }
        }, label: {
            Rectangle()
                .stroke(.black,lineWidth: 1)
                .overlay {
                    Text(pad)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: .infinity, height: .infinity)
                }
        })
    }
    
    func calculate(){
        
    }
}

#Preview {
    ContentView()
}
