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
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var hitMeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Hit Me"
        button.titleLabel?.textColor = .white
        button.setImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        return button
    }()
    
    lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "StartOverIcon"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "InfoButton"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        return button
    }()
    
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
        label.text = "50"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "ArialRoundedMTBold", size: 18)
        return label
    }()
    lazy var targetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50"
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .left
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
       
        // Add background imageView
        self.view.addSubview(backGroundImageview)
        backGroundImageview.pinEdgesToSuperview()
        
        
        self.view.addSubview(topDescLabel)
        topDescLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        topDescLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        topDescLabel.centerHorizontally(-40)
        
         self.view.addSubview(scoreLabel)
        scoreLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: topDescLabel.trailingAnchor, constant: 5).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: topDescLabel.centerYAnchor).isActive = true
        
        sliderStackView.addArrangedSubview(leftLabel)
        sliderStackView.addArrangedSubview(slider)
        sliderStackView.addArrangedSubview(rightLabel)
        self.view.addSubview(sliderStackView)
        
        sliderStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        sliderStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        sliderStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sliderStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        slider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        slider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.80).isActive = true

        leftLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        leftLabel.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.1).isActive = true
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
