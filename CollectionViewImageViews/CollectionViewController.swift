//
//  CollectionViewController.swift
//  CollectionViewImageViews
//
//  Created by Michael Miles on 3/30/22.
//

import UIKit

private let reuseIdentifier = "ImageCollectionViewCell"

class CollectionViewController: UICollectionViewController {
    
    var transitionFrame: CGRect!
    
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
        
        let img = UIImage(named: imageNameArray[indexPath.row])!.resizeImage(maxWidth: 100, maxHeight: 100)
        cell.imageView.image = img
        cell.imageView.frame = CGRect(origin: cell.imageView.frame.origin, size: CGSize(width: img!.size.width, height: img!.size.height))
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        transitionFrame = cell.frame
        let vc = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        vc.image = cell.imageView.image
        vc.modalPresentationStyle = .fullScreen
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    
    

}

extension CollectionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = TransitionAnimator()
        animator.transitionFrame = transitionFrame
        return animator
    }
}

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var transitionFrame: CGRect!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {        
        let toVC = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        
        if let toView = toView {
            transitionContext.containerView.addSubview(toView)
        }
        
        toView?.frame = transitionFrame
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        UIView.animate(withDuration: duration) {
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
        } completion: { completed in
            transitionContext.completeTransition(true)
        }

    }
    
}


