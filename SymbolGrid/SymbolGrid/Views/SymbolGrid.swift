//
//  SymbolGrid.swift
//  SymbolGrid
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

struct SymbolGrid: View {
    
    @State private var isAddingSymbol = false // symbol 추가 여부 변수
    @State private var isEditing = false // symbol 수정 여부 변수
    
    private static let initialColumns = 3 // 기본 3열
    @State private var selectedSymbol: Symbol? // 선택한 symbol
    @State private var numColumns = initialColumns // ?
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns) // grid 행
    
    // symbol 배열
    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
    ]
    
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            // 수정 상태일 때 컬럼 보기 변경 가능(1열, 2열, 3열..), symbol 삭제&추가 가능
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...6, step: 1) { _ in
                    withAnimation { gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns) }
                }
                .padding()
            }
            
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: symbol.name)
                                    .resizable() // 이미지의 크기를 조정하고 싶을 때 꼭 사용, 크기 조정 수정자보다 앞서 선언되어야 함
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundStyle(.blue)
                                    // safe area를 무시한다는 뜻
                                    .ignoresSafeArea(.container, edges: .bottom)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                if isEditing {
                                    Button {
                                        guard let index = symbols.firstIndex(of: symbol) else { return }
                                        withAnimation {
                                            _ = symbols.remove(at: index)
                                        }
                                    } label: {
                                            Image(systemName: "xmark.square.fill")
                                                .font(.title)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, Color.red)
                                        }
                                        .offset(x: 7, y: -7)
                                    }
                                }
                                .padding()
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .navigationTitle("My Symbols")
            .navigationBarTitleDisplayMode(.inline)
            // 새로운 symbol을 추가할 수 있는 sheet화면 연결
            .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
                // binding처리 되어있는 selectedsymbol
                // 해당 파라미터를 하위 뷰인 symbolpicker에 전달하면, 하위 뷰에서 선택된 값을 상위 뷰인 symbolgrid로 값을 가져올 수 있음
                SymbolPicker(symbol: $selectedSymbol)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    // 수정 상태일 경우, Done 레이블 표시
                    // 아닐 경우, Edit 레이블 표시
                    Button(isEditing ? "Done" : "Edit") {
                        withAnimation { isEditing.toggle() }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddingSymbol = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(isEditing)
                }
            }
        }
    
    // 선택된 symbol값을 배열에 저장
    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
}

#Preview {
    SymbolGrid()
}
