//
//  ViewController.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 04/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var backGroundImageview: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Background"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.setValue(50, animated: false)
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var sliderStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var bottomBarStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // Buttons
    lazy var hitMeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Hit Me", for: .normal)
        button.setTitleColor(UIColor(hexFromString: "#601E00"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)

        return button
    }()
    
    lazy var reloadButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "StartOverIcon"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "InfoButton"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // Labels
    lazy var topDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Put the Bull's Eye as close as you can to:"
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "ArialRoundedMTBold", size: 18)
        return label
    }()
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "ArialRoundedMTBold", size: 18)
        return label
    }()
    lazy var targetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score :"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Round :"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var scoreValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var roundValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpValues()
    }
    
    private func setUpValues() {
        scoreValueLabel.text = "0"
        roundValueLabel.text = "1"
        targetLabel.text = String((1...100).randomElement() ?? 0)
    }
        
    
    private func setUpView() {
       
        // Add background imageView
        self.view.addSubview(backGroundImageview)
        backGroundImageview.pinEdgesToSuperview()
        
        
        self.view.addSubview(topDescLabel)
        topDescLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        topDescLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        topDescLabel.centerHorizontally(-40)
        
         self.view.addSubview(targetLabel)
        targetLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        targetLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        targetLabel.leadingAnchor.constraint(equalTo: topDescLabel.trailingAnchor, constant: 5).isActive = true
        targetLabel.centerYAnchor.constraint(equalTo: topDescLabel.centerYAnchor).isActive = true
        
        self.view.addSubview(hitMeButton)
        hitMeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        hitMeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        hitMeButton.centerVertically()
        hitMeButton.centerHorizontally()
        
        
        sliderStackView.addArrangedSubview(leftLabel)
        sliderStackView.addArrangedSubview(slider)
        sliderStackView.addArrangedSubview(rightLabel)
        self.view.addSubview(sliderStackView)
        
        sliderStackView.bottomAnchor.constraint(equalTo: self.hitMeButton.topAnchor, constant: -30).isActive = true
        sliderStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        sliderStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sliderStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        slider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        slider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.93).isActive = true

        leftLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightLabel.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.055).isActive = true
        
        
       
        
        self.view.addSubview(roundLabel)
        roundLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        roundLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        roundLabel.leadingAnchor.constraint(equalTo: hitMeButton.trailingAnchor, constant: 40).isActive = true
        roundLabel.topAnchor.constraint(equalTo: hitMeButton.bottomAnchor, constant: 30).isActive = true
        
        self.view.addSubview(roundValueLabel)
        
        roundValueLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        roundValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        roundValueLabel.leadingAnchor.constraint(equalTo: roundLabel.trailingAnchor).isActive = true
        roundValueLabel.centerYAnchor.constraint(equalTo: roundLabel.centerYAnchor).isActive = true
        
        
        self.view.addSubview(scoreValueLabel)
        scoreValueLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreValueLabel.trailingAnchor.constraint(equalTo: hitMeButton.leadingAnchor).isActive = true
        scoreValueLabel.topAnchor.constraint(equalTo: hitMeButton.bottomAnchor, constant: 30).isActive = true
        
        self.view.addSubview(scoreLabel)
//
        scoreLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: scoreValueLabel.leadingAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: scoreValueLabel.centerYAnchor).isActive = true


        self.view.addSubview(infoButton)
        infoButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoButton.leadingAnchor.constraint(equalTo: roundValueLabel.trailingAnchor, constant: 20).isActive = true
        infoButton.centerYAnchor.constraint(equalTo: roundValueLabel.centerYAnchor).isActive = true
        
        
        self.view.addSubview(reloadButton)
        reloadButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        reloadButton.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: -60).isActive = true
        reloadButton.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor).isActive = true

    }


}
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    func lighter(by percentage: CGFloat = 10.0) -> UIColor {
        return self.adjust(by: abs(percentage))
    }
    
    func darker(by percentage: CGFloat = 10.0) -> UIColor {
        return self.adjust(by: -abs(percentage))
    }
    
    func adjust(by percentage: CGFloat) -> UIColor {
        var alpha, hue, saturation, brightness, red, green, blue, white : CGFloat
        (alpha, hue, saturation, brightness, red, green, blue, white) = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        
        let multiplier = percentage / 100.0
        
        if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            let newBrightness: CGFloat = max(min(brightness + multiplier*brightness, 1.0), 0.0)
            return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
        }
        else if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            let newRed: CGFloat = min(max(red + multiplier*red, 0.0), 1.0)
            let newGreen: CGFloat = min(max(green + multiplier*green, 0.0), 1.0)
            let newBlue: CGFloat = min(max(blue + multiplier*blue, 0.0), 1.0)
            return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
        }
        else if self.getWhite(&white, alpha: &alpha) {
            let newWhite: CGFloat = (white + multiplier*white)
            return UIColor(white: newWhite, alpha: alpha)
        }
        
        return self
    }
}


extension UIView {
    
    func pinEdgesToSuperview(_ offset: CGFloat = 0.0) {
        guard let superview = self.superview else {
            return
        }
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: offset).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: offset).isActive = true
    }
    
    @discardableResult
    func constraintWidth(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.widthAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func constraintHeight(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.heightAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerVertically(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerHorizontally(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
        
    }
    
}

/**
    
    func prepareForConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pinEdgesToSuperview(_ offset: CGFloat = 0.0) {
        guard let superview = self.superview else {
            return
        }
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: offset).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: offset).isActive = true
    }
    
    @discardableResult
    func centerVertically(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerVertically(inRelationTo: UIView, _ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        let superview = inRelationTo
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerHorizontally(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
        
    }
    
    @discardableResult
    func pinLeft(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinfLeftInRelationTo(heightAnchor: NSLayoutXAxisAnchor, constant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.leftAnchor.constraint(equalTo: heightAnchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinRight(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinTop(_ offset: CGFloat = 0.0, target: UIView? = nil) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        var constraint: NSLayoutConstraint?
        
        if let target = target {
            constraint = self.topAnchor.constraint(equalTo: target.bottomAnchor, constant: offset)
        } else {
            constraint = self.topAnchor.constraint(equalTo: superview.topAnchor, constant: offset)
        }
        
        constraint?.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinBottom(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -offset)
        constraint.isActive = true
        return constraint
    }
    
    //pin to safe area on bottom of screen
    @discardableResult
    func pinSafeBottom(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    //pin to safe area on top of screen
    @discardableResult
    func pinSafeTop(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func constraintHeight(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.heightAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func constraintWidth(_ toConstant: CGFloat) -> NSLayoutConstraint? {
        let constraint = self.widthAnchor.constraint(equalToConstant: toConstant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func squareViewConstraint() -> NSLayoutConstraint? {
        let constraint = self.widthAnchor.constraint(equalTo: self.heightAnchor)
        constraint.isActive = true
        return constraint
    }
    
    func roundView() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.clipsToBounds = true
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}

*/
