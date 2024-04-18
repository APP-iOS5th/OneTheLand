
import SwiftUI

struct ContentView: View {
    @State private var resultCouter: Double = 0
    
    let calculatorInputArray: [String] = ["7", "8", "9", "/", "4", "5", "6", "*", "1", "2", "3", "-", ".", "0", "C", "+"]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                // 게산기 결과 창
                HStack{
                    Spacer()
                    
                    Text(resultCouter == 0 ? "0" : "\(resultCouter)")
                        .padding(.trailing, 20)
                        .font(.largeTitle)
                    
                }
                .frame(width: geometry.size.width, height: 100)
                .background(Color.gray)
                
                
                
                // 계산기 입력 창
                VStack(spacing: 20)  {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 20) {
                        ForEach(calculatorInputArray, id: \.self) {idx in
                            Button {
                                print("Hello")
                            } label: {
                                Text("\(idx)")
                            }
                            .frame(width: geometry.size.width / 4 - 20, height: geometry.size.height / 7)
                            .border(Color.black)
                            .tint(Color.black)
                            .font(.title)
                        }
                    }
                  
                    Button {
                        print("Yap")
                    } label: {
                        Text("=")
                    }
                    .frame(width: geometry.size.width, height:100)
                    .border(Color.black)
                    .tint(Color.black)
                    .font(.title)
                    
                }
                .padding(0)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
