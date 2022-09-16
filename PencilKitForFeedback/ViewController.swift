//
//  ViewController.swift
//  PencilKitForFeedback
//
//  Created by Lucek Krzywdzinski on 16/09/2022.
//

import SwiftUI
import PencilKit

class ViewController: UIViewController {
    let canvasView = PKCanvasView()
    
    var toolPicker = PKToolPicker()
    
    let canvasOverscrollHeight: CGFloat = 500
    let canvasWidth: CGFloat = 768
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        canvasView.alwaysBounceVertical = true
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.showsDrawingPolicyControls = true
        
        canvasView.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews has been called. \(count)")
        count += 1
        
        canvasView.frame = view.bounds
        
        let canvasScale = canvasView.bounds.width / canvasWidth
        canvasView.zoomScale = canvasScale
        canvasView.minimumZoomScale = canvasScale
        canvasView.maximumZoomScale = canvasScale
        
        updateContentSizeForDrawing()
        canvasView.contentOffset = CGPoint(x: 0, y: -canvasView.adjustedContentInset.top)
    }
    
    func updateContentSizeForDrawing() {
        let drawing = canvasView.drawing
        let contentHeight: CGFloat
        
        if !drawing.bounds.isNull {
            contentHeight = max(canvasView.bounds.height, (drawing.bounds.maxY + self.canvasOverscrollHeight) * canvasView.zoomScale)
        } else {
            contentHeight = canvasView.bounds.height
        }
        canvasView.contentSize = CGSize(width: canvasWidth * canvasView.zoomScale, height: contentHeight)
    }
}
