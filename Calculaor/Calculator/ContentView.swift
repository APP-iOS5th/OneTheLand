
import SwiftUI

struct ContentView: View {
    @State private var resultCouter: String = "0"
    @State private var prevValue: String = ""
    @State private var currentValue: String = ""
    
    let calculatorInputArray: [String] = ["7", "8", "9", "/", "4", "5", "6", "*", "1", "2", "3", "-", ".", "0", "C", "+"]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                // 게산기 결과 창
                HStack{
                    Spacer()
                    
                    Text(resultCouter)
                        .padding(.trailing, 20)
                        .font(.largeTitle)
                    
                }
                .frame(width: geometry.size.width, height: 100)
                .background(Color.gray)
                
                
                
                // 계산기 입력 창
                VStack(spacing: 20)  {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 20) {
                        ForEach(calculatorInputArray, id: \.self) {key in
                            Button {
                                handleInput(key)
                                
                            } label: {
                                Text("\(key)")
                            }
                            .frame(width: geometry.size.width / 4 - 20, height: geometry.size.height / 7)
                            .border(Color.black)
                            .tint(Color.black)
                            .font(.title)
                        }
                    }
                    
                    Button {
                        
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
    func handleInput(_ input: String) {
        
        
        switch input {
        case ".":
            prevValue += input
            let point = prevValue
            prevValue = point
            resultCouter = prevValue
            
        case "+":
            prevValue += input
            resultCouter = "+"
            currentValue += input
            resultCouter = currentValue
            
        case "C":
            prevValue = ""
            resultCouter = "0"
            currentValue = "0"
            
        default:
            prevValue += input
            resultCouter = prevValue
        }
    }
   
}

#Preview {
    ContentView()
}
