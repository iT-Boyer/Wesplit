//
//  TestUI.swift
//  BetterRest
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI
/**
 在项目中，我们将通过三种方式使用日期：

 选择一个合理的默认“唤醒”时间。
    DateComponents:给我早上8点的起床时间，无论今天是星期几。”
 阅读他们想醒来的小时和分钟。
    我们需要找到一种方法来仅提取小时和分钟的组成部分。
 整齐地显示他们建议的就寝时间。
 */
struct TestUI: View {
    @State var sleepAmount = 8.0
    @State var wakeDate = Date()
    var body: some View {
        VStack {
            DatePicker("选择时间",selection:$wakeDate, in:Date()..., displayedComponents: .hourAndMinute)
                    .labelsHidden()
            Form(content: {
                Section(header: Text("Stepper计步器")) {
                    Stepper(value: $sleepAmount,in:4...12,step:0.25) {
                        Text("\(sleepAmount,specifier: "%g") hours")
                    }
                    Slider(value: $sleepAmount)
                }
                
                // when you create a new Date instance it will be set to the current date and time
                let now = Date()

                // create a second Date instance set to one day in seconds from now
                let tomorrow = Date().addingTimeInterval(86400)

                // create a range from those two
                let range = now ... tomorrow
                
                Section(header: Text("DatePicker日期选贼器")) {
                    DatePicker("选择时间",selection:$wakeDate, in:range)
                }
            })
        }.padding()
    }
}


//获取起床时间
func wakeTime(time:Int)->Date {
    var time = DateComponents()
    time.hour = 8
    time.minute = 0
    let date = Calendar.current.date(from: time) ?? Date()
    return date
}

//从实践选择器中解析时间
func parseDatePicker(date:Date) -> (Int,Int) {
    let time = Calendar.current.dateComponents([.hour,.minute], from: date)
    let hour = time.hour ?? 0
    let min = time.minute ?? 0
    return (hour,min)
}

struct TestUI_Previews: PreviewProvider {
    static var previews: some View {
        TestUI()
    }
}
