//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI

/**
 猜谜游戏，在页面上会随机显示某一个国家的名称，并展示三个国旗，玩家来猜这个国家的国旗，是否在三张图片里，并点击对的哪张图片。
 需要一个国家名称数组，一个区间内的随机数，显示三张图片的
 背景色：使用ZStack来设置背景色
 
 1. 当点击国旗时，弹出答案，让后重置游戏
 2. 记录分数，并显示下国旗下面
 3. 当错误时，提示中显示正确答案
 */

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var allScore = 0
    var body: some View {
        ZStack {
            //线性渐变
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:20,content: {
                VStack {
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) {number in
                    Button(action: {
                        //TODO:alert显示答案，通过状态值，来控制alert是否显示
                        //TODO:判断是否得分
                        flagTapped(number: number)
                    }, label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })
                }
                Text("总得分：\(allScore)")
                Spacer()
            })
        }.alert(isPresented: $showScore, content: {
            Alert(title: Text("答案"), message: Text(scoreTitle), dismissButton: .default(Text("继续"), action: {
                //TODO:重置游戏
                askQuestion()
            }))
        })
    }
    
    func flagTapped(number:Int) {
        //判断结果
        if number == correctAnswer {
            allScore += 10
            self.scoreTitle = "正确，获得总分\(allScore)"
        }else{
            self.scoreTitle = "错误，\(countries[number])国旗"
        }
        self.showScore = true
    }
    
    //重置游戏
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
