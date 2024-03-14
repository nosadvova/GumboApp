//
//  GifView.swift
//  GumboApp
//
//  Created by Vova Novosad on 09.03.2024.
//

import SwiftUI
import FLAnimatedImage

struct GifView: UIViewRepresentable {
    let name: String
    let animationSpeed: CGFloat
    let mit = 5
    
    public init(
        name: String,
        animationSpeed: CGFloat = 1
    ) {
        self.name = name
        self.animationSpeed = animationSpeed
    }
    
    private let imageView: FLAnimatedImageView = {

        let imageView = FLAnimatedImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true

        return imageView

    }()
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        view.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        if let data = try? Data(contentsOf: Bundle.main.url(forResource: name, withExtension: "gif")!) {
            let image = FLAnimatedImage(animatedGIFData: data)
                        
            imageView.animatedImage = image
        }
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
            imageView.stopAnimating()
        }
    }
}
