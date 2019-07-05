//
//  HomeViewController.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 04/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: background Imageview
    lazy var backGroundImageview: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Background"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Slider
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
        slider.addTarget(self, action:#selector(sliderValueChanged(slider:)), for: .valueChanged)
        return slider
    }()
    
    // MARK:  slider stack
    lazy var sliderStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK:  Buttons
    lazy var hitMeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Hit Me", for: .normal)
        button.setTitleColor(UIColor(hexFromString: "#601E00"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        button.addTarget(self, action: #selector(hitMeAction), for: .touchUpInside)
        return button
    }()
    
    lazy var reloadButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "StartOverIcon"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetValues), for: .touchUpInside)
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "InfoButton"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(infoAction), for: .touchUpInside)
        return button
    }()
    
    
    // MARK:  Labels
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
    
    // MARK:  local variables
    var selectedValue:Int = 0
    var targetValue:Int = 0
    var score:Int = 0 {
        didSet {
            scoreValueLabel.text = "\(score)"
        }
    }
    var round: Int = 0 {
        didSet {
            roundValueLabel.text = "\(round)"
        }
    }
    
    // MARK:  ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        resetValues()
    }

    // MARK:  Setup views - Adding constraints
    private func setUpView() {
       
        // Add background imageView
        self.view.addSubview(backGroundImageview)
        backGroundImageview.pinEdgesToSuperview()
        
        
        // Add top labels
        self.view.addSubview(topDescLabel)
        topDescLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        topDescLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        topDescLabel.centerHorizontally(-40)
        
         self.view.addSubview(targetLabel)
        targetLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        targetLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        targetLabel.leadingAnchor.constraint(equalTo: topDescLabel.trailingAnchor, constant: 5).isActive = true
        targetLabel.centerYAnchor.constraint(equalTo: topDescLabel.centerYAnchor).isActive = true
        
        // Add hitme button
        self.view.addSubview(hitMeButton)
        hitMeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        hitMeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        hitMeButton.centerVertically()
        hitMeButton.centerHorizontally()
        
        
        // Add slider and labels
        sliderStackView.addArrangedSubview(leftLabel)
        sliderStackView.addArrangedSubview(slider)
        sliderStackView.addArrangedSubview(rightLabel)
        self.view.addSubview(sliderStackView)
        
        sliderStackView.bottomAnchor.constraint(equalTo: self.hitMeButton.topAnchor, constant: -30).isActive = true
        sliderStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        sliderStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sliderStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        slider.heightAnchor.constraint(equalToConstant: 50).isActive = true
        slider.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.85).isActive = true

        leftLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightLabel.widthAnchor.constraint(equalTo: sliderStackView.widthAnchor, multiplier: 0.10).isActive = true
        
        
        // Add roudn label
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
        
        
        // Add score lable
        self.view.addSubview(scoreValueLabel)
        scoreValueLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreValueLabel.trailingAnchor.constraint(equalTo: hitMeButton.leadingAnchor).isActive = true
        scoreValueLabel.topAnchor.constraint(equalTo: hitMeButton.bottomAnchor, constant: 30).isActive = true
        
        self.view.addSubview(scoreLabel)

        scoreLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: scoreValueLabel.leadingAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: scoreValueLabel.centerYAnchor).isActive = true


        // Add info label
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


// game Actions
extension HomeViewController {
    
    // MARK:  Reset action
    @objc func resetValues() {
        targetLabel.text = String((1...100).randomElement() ?? 0)
        selectedValue = 0
        targetValue = Int(targetLabel.text ?? "0") ?? 0
        score = 0
        round = 0
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            let value = Float(self.targetValue)
            self.slider.setValue(value, animated: true)
        })
        
    }
    
    // MARK:  Hitme button action
    @objc func hitMeAction() {
        let difference = abs(targetValue - selectedValue)
        let points = 100 - difference
        
        switch difference {
        case 0:
            showSlert(message: "Perfect!") {
                self.score += points
                points += 100
            }
        case <5:
            
            showSlert(message: "Perfect!") {
                self.score += points
            }
        default:
            
        }
    }
    
    // MARK:  info button action
    @objc func infoAction() {
        
    }
    
    // MARK:  slider value change action
    @objc func sliderValueChanged(slider: UISlider) {
        selectedValue = Int(slider.value.rounded())
    }
    
    // MARK:  show alert
    func showSlert(message:String, actionFunc: (()->())?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            actionFunc?()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
