//
//  ImageViewController.swift
//  CollectionViewImageViews
//
//  Created by Michael Miles on 3/30/22.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image.resizeImage(maxWidth: view.frame.width, maxHeight: view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageView.frame = CGRect(origin: imageView.frame.origin, size: CGSize(width: imageView.image!.size.width, height: imageView.image!.size.width))
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
