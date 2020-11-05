//
//  ImageWithoutRender.swift
//  Gambit
//
//  Created by arsik on 05.11.2020.
//

import UIKit

// Для покраски изображений в trailingSwipeActionsConfigurationForRowAt

final class ImageWithoutRender: UIImage {
    
    override func withRenderingMode(_ renderingMode: UIImage.RenderingMode) -> UIImage {
        return self
    }
}
