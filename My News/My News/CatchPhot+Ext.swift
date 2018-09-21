//
//  CatchPhot+Ext.swift
//  My News
//
//  Created by Israel Manzo on 9/20/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func cacheUrlString(urlString: String){
        image = nil
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = cacheImage
            return
        }
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
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
