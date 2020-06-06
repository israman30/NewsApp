//
//  ImageCache.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - IMAGE CACHE EXTENSION
let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    // MARK: - Caching image method
    func cacheUrlString(urlString: String) {
        
        // Reset image
        image = nil
        // Check if an image exit, an assign it to the image object
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = cacheImage
            return
        }
        // If the image does not exit, fetch a new one
        session(with: urlString)
    }
    
    // MARK: - Fetch image method with URLSession
    private func session(with urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error, could not display image", error.localizedDescription)
                return
            } else {
                DispatchQueue.main.async {
                    if let imageCached = UIImage(data: data!) {
                        imageCache.setObject(imageCached, forKey: urlString as AnyObject)
                        self.image = imageCached
                    }
                }
            }
        }).resume()
    }
}
