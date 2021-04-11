//
//  GridStack.swift
//  ViewsAndModifiers
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI
/**
 https://www.hackingwithswift.com/books/ios-swiftui/custom-containers
 自定义容器
 
 隐式HStack：通过init @ViewBuilder @escaping方式实现隐式
 调用方式变化
 ```
 GridStack(rows: 4, columns: 4) { row, col in
     HStack {
         Image(systemName: "\(row * 4 + col).circle")
         Text("R\(row) C\(col)")
     }
 }
 ```
 后
 ```swift
 GridStack(rows: 4, columns: 4) { row, col in
     Image(systemName: "\(row * 4 + col).circle")
     Text("R\(row) C\(col)")
 }
 ```
 */
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}
