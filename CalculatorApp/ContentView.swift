//
//  ContentView.swift
//  CalculatorApp
//
//  Created by 이상민 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            //키패드 생성
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                GridRow {
                    KeypadBtn(pad: "7")
                    KeypadBtn(pad: "8")
                    KeypadBtn(pad: "9")
                    KeypadBtn(pad: "/")
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: "4")
                    KeypadBtn(pad: "5")
                    KeypadBtn(pad: "6")
                    KeypadBtn(pad: "*")
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: "1")
                    KeypadBtn(pad: "2")
                    KeypadBtn(pad: "3")
                    KeypadBtn(pad: "-")
                }//: GRIDROW
                GridRow {
                    KeypadBtn(pad: ".")
                    KeypadBtn(pad: "0")
                    KeypadBtn(pad: "C")
                    KeypadBtn(pad: "+")
                }//: GRIDROW
                KeypadBtn(pad: "=")
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
    var body: some View {
        Button(action: {
            
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
}

#Preview {
    ContentView()
}
