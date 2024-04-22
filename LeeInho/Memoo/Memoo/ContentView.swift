//
//  ContentView.swift
//  Memoo
//
//  Created by 이인호 on 4/22/24.
//

import SwiftUI
import SwiftData
import CoreData

struct ContentView: View {
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: String = "0x007AFF"
    let colors: [String] = ["0x007AFF", "0x00FFFF", "0x800080", "0x808080", "0x4B0082"]
    
    @Query(sort: \Memo.created, order: .reverse) var memos: [Memo] = []
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color(hex: memo.color))
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button(role: .destructive) {
                        deleteMemo(memo)
                    } label: {
                        Image(systemName: "trash")
                        Text("삭제")
                    }
                }
//                .swipeActions(edge: .trailing) {
//                    Button(role: .destructive) {
//                        deleteMemo(memo)
//                    } label: {
//                        Label("Delete", systemImage: "trash")
//                    }
//                }
            }
            .listStyle(.plain)
            .navigationTitle("memo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        memoText = ""
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors)
            }
        }
    }
    
    func deleteMemo(_ memo: Memo) {
        modelContext.delete(memo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
