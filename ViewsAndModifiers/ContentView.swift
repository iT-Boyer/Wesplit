//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI

struct ContentView: View {
    //计算属性视图
    var motto1: some View { Text("Draco dormiens") }
    //属性视图
    let motto2 = Text("nunquam titillandus")
    var body: some View {
        
        VStack {
            
            Form(content: {
                Section(header: Text("自定义九宫格容器")) {
                    GridStack(rows: 4, columns: 4) { row, col in
                        Image(systemName: "\(row * 4 + col).circle")
                        Text("R\(row) C\(col)")
                    }
                }
                Section(header:Text("修饰器：属性很重要").font(.title2)) {
                    Button("Hello World") {
                        print(type(of: self.body))
                    }
                    .background(Color.red)
                    .frame(width: 140, height: 40)
                    
                    Text("Hello World")
                        .padding()
                        .background(Color.red)
                        .padding()
                        .background(Color.blue)
                        .padding()
                        .background(Color.green)
                        .padding()
                        .background(Color.yellow)
                }
                //属性视图
                Section(header: Text("属性视图").font(.title2)) {
                    motto1
                    motto2
                }
                
                Section(header: Text("组合视图").font(.title2)) {
                    CapsuleText(text: "测试")
                    CapsuleText(text: "测试2")
                }
                
                Section(header: Text("自定义修饰器").font(.title2)) {
                    Text("封装水印效果属性")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .watermarked(with: "logo")
                    Text("自定义修饰符")
                        .modifier(Title())
                    Text("扩展View的属性")
                        .titleStyle()
                }
            })
            
        }
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .watermarked(with: "组合视图")
    }
}

//扩展View的属性
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

//MARK: 自定义修改器
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .watermarked(with: "Hacking with Swift")
    }
}


struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
