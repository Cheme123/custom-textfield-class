//
//  CustomTextFieldClass.swift
//  Veganize
//
//  Created by Miguel Angel on 4/27/17.
//  Copyright © 2017 Veganize. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextFieldClass: UITextField {
    
    // ***** IB DESIGNABLES *****
    // commit change

    // Handles the corner radius of the textField
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // ** LEFT IMAGE DESIGNABLES **
    // Handles the creation of the leftImage of the textField
    @IBInspectable var leftImage: UIImage? {
        didSet {
            createLeftImage()
        }
    }
    // Controls the image height of the left image
    // starts at 20 (standard) can be changed
    @IBInspectable var leftImageHeight: CGFloat = 20 {
        didSet{
            createLeftImage()
        }
    }
    // Controls the image height of the right image
    // starts at 20 (standard) can be changed
    @IBInspectable var leftImageWidth: CGFloat = 20 {
        didSet{
            createLeftImage()
        }
    }
    // Controls the space between the left border of the textField towards the image created
    @IBInspectable var leftImagePadding: CGFloat = 0 {
        didSet{
            createLeftImage()
        }
    }
    @IBInspectable var leftImageTintColor: UIColor? {
        didSet{
            createLeftImage()
        }
    }
    // Controls the alpha(opacity) of the leftImage
    // starts at 1 (standard) can be changed
    @IBInspectable var leftImageAlpha: CGFloat = 1 {
        didSet{
            createLeftImage()
        }
    }
    // ** END OF LEFT IMAGE DESIGNABLES **
    
    // ** RIGHT IMAGE DESIGNABLES **
    // Handles the creation of the leftImage of the textField
    @IBInspectable var rightImage: UIImage? {
        didSet {
            createRightImage()
        }
    }
    // Controls the image height of the left image
    // starts at 20 (standard) can be changed
    @IBInspectable var rightImageHeight: CGFloat = 20 {
        didSet{
            createRightImage()
        }
    }
    // Controls the image height of the rightImage
    // starts at 20 (standard) can be changed
    @IBInspectable var rightImageWidth: CGFloat = 20 {
        didSet{
            createRightImage()
        }
    }
    // Controls the space between the left border of the textField towards the image created
    @IBInspectable var rightImagePadding: CGFloat = 0 {
        didSet{
            createRightImage()
        }
    }
    @IBInspectable var rightImageTintColor: UIColor? {
        didSet{
            createRightImage()
        }
    }
    // Controls the alpha(opacity) of the rightImage
    // starts at 1 (standard) can be changed
    @IBInspectable var rightImageAlpha: CGFloat = 1 {
        didSet{
            createRightImage()
        }
    }
    // ** END OF RIGHT IMAGE DESIGNABLES **

    
    // ** RIGHT BUTTON TEXT DESIGNABLES **
    // Creates the button with the given title as label
    @IBInspectable var rightButtonText: String? {
        didSet{
            createRightButton()
        }
    }
    // Controls the color of the button title
    @IBInspectable var rightButtonTextColor: UIColor?  {
        didSet{
            createRightButton()
        }
    }
    
    // Controls the font of the button title
    // starts at 12 (standard) can be changed
    @IBInspectable var rightButtonFont: CGFloat = 12  {
        didSet{
            createRightButton()
        }
    }
    
    // Controls the space between the right border of the textField towards the button created
    @IBInspectable var rightButtonPadding: CGFloat = 0 {
        didSet{
            createRightButton()
        }
    }
    
    // Controls the width of the right button
    // starts at 20 (standard) can be changed
    @IBInspectable var rightButtonWidth: CGFloat = 60 {
        didSet{
            createRightButton()
        }
    }
    
    // Controls the height of the right button
    // starts at 20 (standard) can be changed
    @IBInspectable var rightButtonHeight: CGFloat = 20 {
        didSet{
            createRightButton()
        }
    }
    // ** END OF RIGHT BUTTON DESIGNABLES **
    // ***** END IB DESIGNABLES *****

    
    // ***** FUNCTIONS *****
    
    // CREATE RIGHT BUTTON
    // PURPOSE: creates an button, which title is set by the @IBDesignable "rightButtonText", and assigns it to rightView of the textField
    private func createRightButton() {
        // checks if there is a String 
        if rightButtonText != "" {
            // enables the left view mode of the textField
            rightViewMode = .always
            
            //creation of the actual button using @IBDesignables: rightButtonPadding, rightButtonWidth, rightButtonHeight
            let changeTextButton = DesignableButton(frame: CGRect(x: rightButtonPadding, y: 0, width: rightButtonWidth, height: rightButtonHeight))
            
            // assigns the function that will occur when the button is pressed -> rightButtonAction
            changeTextButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
            
            // Atrributes: @IBDesignables: rightButtonTitle, rightButtonLabelColor, rightLabelFontSize
            changeTextButton.setTitle(rightButtonText, for: .normal)
            changeTextButton.setTitleColor(rightButtonTextColor, for: .normal)
            changeTextButton.titleLabel?.font = UIFont.systemFont(ofSize: rightButtonFont)
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: rightButtonWidth, height: rightButtonHeight))
            view.addSubview(changeTextButton)
            rightView = changeTextButton
        }
    }
    func rightButtonAction() {
        print("Right Button Worked")
    }
    
    // CREATE LEFT IMAGE
    // PURPOSE: creates an imageView, which image is set by the @IBDesignable "leftImage", and assigns it to leftView of the textField
    private func createLeftImage(){
        // checks if the image exists (an image has to be provided)
        if let image = leftImage {
            // enables the left view mode of the textField
            leftViewMode = .always
            
            //creation of the actual imageView using @IBDesignables: leftImagePadding, leftImageWidth, leftImageHeight
            let leftImageView = UIImageView(frame: CGRect(x: leftImagePadding, y: 0, width: leftImageWidth, height: leftImageHeight))
            
            // assigns image (conditional to check if there is an image) to the leftImageView
            leftImageView.image = image
            
            // general attributes assigned in @IBDesignables
            leftImageView.tintColor = leftImageTintColor
            leftImageView.alpha = leftImageAlpha
            
            // creates a view so that the image is correcly formatted and centered, and can be moved inside this view using @IBDesignable leftImagePadding
            let view = UIView(frame: CGRect(x: 0, y: 0, width: leftImageWidth, height: leftImageHeight))
            view.addSubview(leftImageView)
            leftView = view
            
        } else {
            // no image set
            leftViewMode = .never
        }
        // Placeholder Text Attribute
         attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSForegroundColorAttributeName: tintColor])
    }
    
    // CREATE RIGHT IMAGE
    // PURPOSE: creates an imageView, which image is set by the @IBDesignable "rightImage", and assigns it to rightView of the textField
    private func createRightImage(){
        // checks if the image exists (an image has to be provided)
        if rightImage == self.rightImage {
            // enables the left view mode of the textField
            rightViewMode = .always
            
            //creation of the actual imageView using @IBDesignables: rightImagePadding, rightImageWidth, rightImageHeight
            let rightImageView = UIImageView(frame: CGRect(x: rightImagePadding, y: 0, width: rightImageWidth, height: rightImageHeight))
            
            // assigns image (conditional to check if there is an image) to the leftImageView
            rightImageView.image = rightImage
            
            // general attributes assigned in @IBDesignables
            rightImageView.tintColor = rightImageTintColor
            rightImageView.alpha = rightImageAlpha
            
            // creates a view so that the image is correcly formatted and centered, and can be moved inside this view using @IBDesignable leftImagePadding
            let view = UIView(frame: CGRect(x: 0, y: 0, width: rightImageWidth, height: rightImageHeight))
            view.addSubview(rightImageView)
            rightView = view
            
        } else {
            // no image set
            rightViewMode = .never
        }
        // Placeholder Text Attribute
         attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSForegroundColorAttributeName: tintColor])
    }
    
    // ***** END FUNCTIONS *****

    
}
