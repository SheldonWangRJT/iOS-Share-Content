//
//  ViewController.swift
//  Share
//
//  Created by Xiaodan Wang on 11/4/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    final private let stringWithLink = "Please download this app here in App Store: https://google.com"
    
    @IBAction func shareStringTapped(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [stringWithLink], applicationActivities: nil)
         
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
        present(activityController, animated: true) {
            print("presented")
        }
    }
    
    @IBAction func shareImageTapped(_ sender: Any) {
        guard let image = UIImage(named: "img") else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
        present(activityController, animated: true) {
            print("presented")
        }
    }
    
    @IBAction func sharePDFTapped(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "img", withExtension: "pdf") else { return }
        let controller = UIDocumentInteractionController(url: url)
        controller.delegate = self
        controller.presentPreview(animated: true)
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }

}

