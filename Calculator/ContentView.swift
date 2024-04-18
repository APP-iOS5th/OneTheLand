
import SwiftUI

struct ContentView: View {
    @State private var resultCout = 0
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    TextField("계산기 입력.", text: $resultCout)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
