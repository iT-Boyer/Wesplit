//
//  UITest.swift
//  GuessTheFlag
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI

/**
 练习Stack
 3x3网格
 颜色
 颜色是一个View，可以理解为有颜色的Spacer，Color会自动填充剩余的空白区。
 颜色：支持三种渐变方式：线性渐变，径向渐变，角度渐变
 按钮：可以设置title+action，还是通过Action+View组合方式自定义Button样式
 AlertVIew:触发机制，通过监听一个布尔属性状态值，来判断是否显示
 */

struct UITest: View {
    @State var isShowAlert = false
    var body: some View {
        VStack(spacing:10, content: {
            
            Button(action: {
                print("我是你写的第一个按钮")
                self.isShowAlert = true
            }, label: {
                Text("Button")
                Circle()
                    .frame(width: 15, height: 15)
                    .padding(.leading,-6)
                Image("")
                    .renderingMode(.original)
            }).alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("友情提示"), message: Text("我是第一个AlertView"), dismissButton: .default(Text("OK")))
            })
            
            //分割线
            Color.purple.frame(height: 10)
            HStack(spacing:20) {
                Text("Placeholder")
                Text("Placeholder")
                Text("Placeholder")
            }.background(Color.orange)
            HStack(spacing:20) {
                Text("Placeholder")
                Text("Placeholder")
                Text("Placeholder")
            }.background(Color.gray)
            HStack(spacing:20) {
                Color.red
                    .frame(width: 100, height: 15)
//                Text("Placeholder")
                Text("Placeholder")
                Text("Placeholder")
                    .background(Color.red)
            }.background(Color.blue)
    
            Section(header:Text("渐变模块")) {
                //线性渐变
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                //径向渐变
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
                //角度渐变
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            }.background(Color.red)
            .frame(height: 40) //自动作用到内部的View上，统一高度为40，header也是40.
            Spacer()
        })
    }
}

struct UITest_Previews: PreviewProvider {
    static var previews: some View {
        UITest()
    }
}
