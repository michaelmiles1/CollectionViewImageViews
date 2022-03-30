//
//  ImageUtil.swift
//  CollectionViewImageViews
//
//  Created by Michael Miles on 3/30/22.
//

import UIKit

extension UIImage {
    func resizeImage(maxWidth: CGFloat, maxHeight: CGFloat) -> UIImage? {
        var newWidth = maxWidth
        var newHeight = maxHeight
        
        if self.size.height > self.size.width {
            let scale = newHeight / self.size.height
            newWidth = self.size.width * scale
        }
        else {
            let scale = newWidth / self.size.width
            newHeight = self.size.height * scale
        }
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
