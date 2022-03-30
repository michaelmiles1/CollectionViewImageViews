//
//  CollectionViewController.swift
//  CollectionViewImageViews
//
//  Created by Michael Miles on 3/30/22.
//

import UIKit

private let reuseIdentifier = "ImageCollectionViewCell"

class CollectionViewController: UICollectionViewController {
    
    let imageNameArray = [
        "nature-pool",
        "ocean-rocks",
        "grass-hills",
        "bluebird",
        "sunset",
        "rocky-beach"
    ]

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        let img = resizeImage(image: UIImage(named: imageNameArray[indexPath.row])!, maxWidth: 100, maxHeight: 100)
        cell.imageView.image = img
        cell.imageView.frame = CGRect(origin: cell.imageView.frame.origin, size: CGSize(width: img!.size.width, height: img!.size.height))
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        print(cell.frame)
    }
    
    func resizeImage(image: UIImage, maxWidth: CGFloat, maxHeight: CGFloat) -> UIImage? {
        var newWidth = maxWidth
        var newHeight = maxHeight
        
        if image.size.height > image.size.width {
            let scale = newHeight / image.size.height
            newWidth = image.size.width * scale
        }
        else {
            let scale = newWidth / image.size.width
            newHeight = image.size.height * scale
        }
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }

}
