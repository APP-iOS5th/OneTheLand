//
//  MemoAddView.swift
//  Memoo
//
//  Created by 이인호 on 4/22/24.
//

import SwiftUI
import SwiftData

struct MemoAddView: View {
    @Binding var isSheetShowing: Bool
    @Binding var memoText: String
    @Binding var memoColor: String
    let colors: [String]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") { isSheetShowing = false }
                Spacer()
                Button("완료") {
                    addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }.disabled(memoText.isEmpty)
            }
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(Color(hex: color))
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            Divider().padding()
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
            .padding()
            .foregroundStyle(.white)
            .background(Color(hex: memoColor))
            .shadow(radius: 3)
            Spacer()
        }
        .padding()
    }
    
    func addMemo(_ text: String, color: String) {
        let newMemo = Memo(text: text, color: color, created: Date())
        modelContext.insert(newMemo)
    }
}

//#Preview {
//    MemoAddView()
//}
