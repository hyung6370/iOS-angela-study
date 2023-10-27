//
//  ViewController.swift
//  snapkit_bakery
//
//  Created by KIM Hyung Jun on 10/27/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var bannerImageView: UIImageView = {
        let object = UIImageView()
        
        object.image = UIImage(named: "Banner")
        object.contentMode = .scaleAspectFill
        
        return object
    }()
    
    var titleLabel: UILabel = {
        let object = UILabel()
        
        object.font = UIFont(name: "Hack-Regular", size: 20)
        object.numberOfLines = 0
        object.textAlignment = .center
        
        return object
    }()
    
    var descriptionLabel: UILabel = {
        let object = UILabel()
        
        object.font = .systemFont(ofSize: 14)
        object.numberOfLines = 0
        object.textAlignment = .center
        
        return object
    }()
    
    var continueWithEmailButton: UIButton = {
        let object = UIButton()
        
        object.titleLabel?.font = UIFont(name: "Hack-Bold", size: 14)
        object.backgroundColor = UIColor(named: "ColorButton")!
        object.titleLabel?.textColor = .white
        object.layer.cornerRadius = 4
        
        return object
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupObjects()
        setupUI()
    }
    private func setupUI() {
        self.view.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.width.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
        }
        
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(50)
            $0.left.equalTo(bannerImageView.snp.left)
            $0.right.equalTo(bannerImageView.snp.right)
        }
        
        self.view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.left.equalTo(titleLabel.snp.left)
            $0.right.equalTo(titleLabel.snp.right)
        }
        
        self.view.addSubview(continueWithEmailButton)
        continueWithEmailButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            $0.width.equalTo(241)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(64)
        }
    }
    
    private func setupObjects() {
        titleLabel.text = "The Only Bakery You'll Love Our Bread is Tasty & Healthy"
        descriptionLabel.text = "We use MAIA made by us with water and flour without improvers."
        continueWithEmailButton.setTitle("Continue with Email", for: .normal)
        continueWithEmailButton.addTarget(self, action: #selector(continueWithEmailButtonPressed), for: .touchUpInside)
    }
    
    
    @objc func continueWithEmailButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert!", message: "Continue with email is pressed!", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true)
    }
}
