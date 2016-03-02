//
//  ViewController.swift
//  TakePictures
//
//  Created by Alfred Hanssen on 3/1/16.
//  Copyright © 2016 One Month. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // MARK: Actions

    @IBAction func presentCamera()
    {
        let sourceType = UIImagePickerControllerSourceType.Camera

        self.presentImagePicker(sourceType: sourceType)
    }
    
    @IBAction func presentPhotoLibrary()
    {
        let sourceType = UIImagePickerControllerSourceType.PhotoLibrary

        self.presentImagePicker(sourceType: sourceType)
    }
    
    @IBAction func presentSavedPhotosAlbum()
    {
        let sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        self.presentImagePicker(sourceType: sourceType)
    }
    
    // MARK: Private API

    private func presentImagePicker(sourceType sourceType: UIImagePickerControllerSourceType)
    {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) == false
        {
            // The sourceType is not available
            
            return
        }
        
        let viewController = UIImagePickerController()
        viewController.sourceType = sourceType
        viewController.delegate = self
        
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            // Do something with the image
        }
        else if let URL = info[UIImagePickerControllerMediaURL] as? NSURL
        {
            // Do something with the URL
            print(URL.absoluteString)
        }

        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

