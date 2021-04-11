//
//  TextFieldHideKeyboard.swift
//  Wesplit
//
//  Created by boyer on 2021/4/11.
//
/**
 https://www.dabblingbadger.com/blog/2020/11/5/dismissing-the-keyboard-in-swiftui
 解决隐藏键盘的方法
 1. 通过UIKit响应链方式：
 2. 通过扩展UIAppliction的手势来实现
 */

import UIKit

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        tapGesture.name = "MyTapGesture"
        window.addGestureRecognizer(tapGesture)
    }
 }

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false // set to `false` if you don't want to detect tap during other gestures
    }
}
