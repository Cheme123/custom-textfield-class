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
    @IBInspectable var LImageHeight: CGFloat = 20 {
        didSet{
            createLeftImage()
        }
    }
    // Controls the image height of the right image
    // starts at 20 (standard) can be changed
    @IBInspectable var LImageWidth: CGFloat = 20 {
        didSet{
            createLeftImage()
        }
    }
    // Controls the space between the left border of the textField towards the image created
    @IBInspectable var LImagePadding: CGFloat = 0 {
        didSet{
            createLeftImage()
        }
    }
    @IBInspectable var LImageTint: UIColor? {
        didSet{
            createLeftImage()
        }
    }
    // Controls the alpha(opacity) of the leftImage
    // starts at 1 (standard) can be changed
    @IBInspectable var LImageAlpha: CGFloat = 1 {
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
    @IBInspectable var RImageHeight: CGFloat = 20 {
        didSet{
            createRightImage()
        }
    }
    // Controls the image height of the rightImage
    // starts at 20 (standard) can be changed
    @IBInspectable var RImageWidth: CGFloat = 20 {
        didSet{
            createRightImage()
        }
    }
    // Controls the space between the left border of the textField towards the image created
    @IBInspectable var RImagePadding: CGFloat = 0 {
        didSet{
            createRightImage()
        }
    }
    @IBInspectable var RImageTint: UIColor? {
        didSet{
            createRightImage()
        }
    }
    // Controls the alpha(opacity) of the rightImage
    // starts at 1 (standard) can be changed
    @IBInspectable var RImageAlpha: CGFloat = 1 {
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
    
    // Creates the button with the given title as label
    @IBInspectable var rightButtonImage: UIImage? {
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
    
    // CREATE RIGHT BUTTON WITH STRING
    // PURPOSE: creates an button, which title is set by the @IBDesignable "rightButtonText", and assigns it to rightView of the textField
    private func createRightButton() {
        // checks if there is a String 
        if rightButtonText != "" || rightImage != nil {
            // enables the left view mode of the textField
            rightViewMode = .always
            
            //creation of the actual button using @IBDesignables: rightButtonPadding, rightButtonWidth, rightButtonHeight
            let changeTextButton = DesignableButton(frame: CGRect(x: rightButtonPadding, y: 0, width: rightButtonWidth, height: rightButtonHeight))
            
            // assigns the function that will occur when the button is pressed -> rightButtonAction
            changeTextButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
            
            // Atrributes: @IBDesignables: rightButtonTitle, rightButtonImage, rightButtonLabelColor, rightLabelFontSize
            changeTextButton.setTitle(rightButtonText, for: .normal)
            changeTextButton.setTitleColor(rightButtonTextColor, for: .normal)
            changeTextButton.titleLabel?.font = UIFont.systemFont(ofSize: rightButtonFont)
            changeTextButton.setBackgroundImage(rightImage, for: .normal)
            
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: rightButtonWidth, height: rightButtonHeight))
            view.addSubview(changeTextButton)
            rightView = changeTextButton
        }
    }
    // Controls what happens when the rightButton is pressed
    func rightButtonAction() {
        print("Right Button Worked")
    }
    // END OF RIGHT BUTTON FUNCTIONS
    
    // CREATE LEFT IMAGE
    // PURPOSE: creates an imageView, which image is set by the @IBDesignable "leftImage", and assigns it to leftView of the textField
    private func createLeftImage(){
        // checks if the image exists (an image has to be provided)
        if let image = leftImage {
            // enables the left view mode of the textField
            leftViewMode = .always
            
            //creation of the actual imageView using @IBDesignables: leftImagePadding, leftImageWidth, leftImageHeight
            let leftImageView = UIImageView(frame: CGRect(x: LImagePadding, y: 0, width: LImageWidth, height: LImageHeight))
            
            // assigns image (conditional to check if there is an image) to the leftImageView
            leftImageView.image = image
            
            // general attributes assigned in @IBDesignables
            leftImageView.tintColor = LImageTint
            leftImageView.alpha = LImageAlpha
            
            // creates a view so that the image is correcly formatted and centered, and can be moved inside this view using @IBDesignable leftImagePadding
            let view = UIView(frame: CGRect(x: 0, y: 0, width: LImageWidth, height: LImageHeight))
            view.addSubview(leftImageView)
            leftView = view
            
        } else {
            // no image set
            leftViewMode = .never
        }
        // Placeholder Text Attributes
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
            let rightImageView = UIImageView(frame: CGRect(x: RImagePadding, y: 0, width: RImageWidth, height: RImageHeight))
            
            // assigns image (conditional to check if there is an image) to the leftImageView
            rightImageView.image = rightImage
            
            // general attributes assigned in @IBDesignables
            rightImageView.tintColor = RImageTint
            rightImageView.alpha = RImageAlpha
            
            // creates a view so that the image is correcly formatted and centered, and can be moved inside this view using @IBDesignable leftImagePadding
            let view = UIView(frame: CGRect(x: 0, y: 0, width: RImageWidth, height: RImageHeight))
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
