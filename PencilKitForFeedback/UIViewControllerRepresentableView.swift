//
//  UIViewControllerRepresentableView.swift
//  PencilKitForFeedback
//
//  Created by Lucek Krzywdzinski on 16/09/2022.
//

import SwiftUI

struct UIViewControllerRepresentableView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}
