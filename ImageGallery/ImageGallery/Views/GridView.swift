//
//  GridView.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// 이미지 갤러리 화면
struct GridView: View {
    @EnvironmentObject var dataModel: DataModel // 최상위 뷰에 전달되어 있는 데이터와 연결, 단일 이미지 url을 참조
    
    private static let initialColumns = 3
    @State private var isAddingPhoto = false // 사진 추가 버튼을 누를때마다 true로 전환
    @State private var isEditing = false // true일 경우, 각 사진에 x버튼이 표시됨
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private  var numColumns = initialColumns
    
    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                // column을 1~8까지 조절 가능한 -/+ 버튼이 생김
                ColumnStepper(title: columnsTitle, range: 1...8, columns: $gridColumns)
                    .padding()
            }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(dataModel.items) { item in
                        // 상위 뷰의 너비와 높이에 대한 정보 제공 -> 하위 뷰 크기 설정
                        GeometryReader { geo in
                            NavigationLink(destination: DetailView(item: item)) {
                                // 사진 클릭시, 개별 사진을 볼 수 있는 화면으로 이동
                                GridItemView(size: geo.size.width, item: item)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            // isEditing = true이라면
                            // 이미지 위에 x버튼(이미지 삭제 버튼)이 띄워짐
                            if isEditing {
                                Button {
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(Font.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .red)
                                }
                                .offset(x: 7, y: -7)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        // 사진 추가 시트 모달 나타내기
        .sheet(isPresented: $isAddingPhoto) {
            PhotoPicker()
        }
        .toolbar {
            // 사진 편집&완료 버튼
            ToolbarItem(placement: .topBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            // 사진 추가 버튼
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAddingPhoto = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
}

#Preview {
    GridView().environmentObject(DataModel())
        .previewDevice("iPad (8th generation)")
}
