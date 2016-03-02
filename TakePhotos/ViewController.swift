//
//  ViewController.swift
//  TakePictures
//
//  Created by Alfred Hanssen on 3/1/16.
//  Copyright © 2016 One Month. All rights reserved.
//

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
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

