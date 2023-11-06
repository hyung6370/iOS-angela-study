//
//  RootViewController.swift
//  kakaoLogin
//
//  Created by KIM Hyung Jun on 11/6/23.
//

import UIKit
import SnapKit
import Then

class RootViewController: UIViewController {
    
    lazy var kakaoLoginStatusLabel = UILabel().then {
        $0.text = "로그인 여부 라벨"
    }
    
    lazy var kakaoLoginButotn = UIButton().then {
        $0.setTitle("카카오로 로그인하기", for: .normal)
        $0.configuration = .filled()
        $0.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var kakaoLogoutButotn = UIButton().then {
        $0.setTitle("로그아웃하기", for: .normal)
        $0.configuration = .filled()
        $0.addTarget(self, action: #selector(logoutBtnClicked), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var kakaoAuthVM = { KakaoAuthVM() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        setupCallbacks()
    }
    
    func configureUI() {
        kakaoLoginStatusLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(70)
        }
        stackView.addArrangedSubview(kakaoLoginStatusLabel)
        stackView.addArrangedSubview(kakaoLoginButotn)
        stackView.addArrangedSubview(kakaoLogoutButotn)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalTo(view)
        }
    }
    
    func setupCallbacks() {
        kakaoAuthVM.onLoginSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.kakaoLoginStatusLabel.text = "로그인이 완료되었습니다."
            }
        }
        
        kakaoAuthVM.onLoginFailure = { [weak self] error in
            DispatchQueue.main.async {
                self?.kakaoLoginStatusLabel.text = "로그인 실패: \(error.localizedDescription)"
            }
        }
        
        kakaoAuthVM.onLogoutSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.kakaoLoginStatusLabel.text = "로그인을 해주세요."
            }
        }
    }
    
    // MARK: - 버튼 액션
    @objc func loginBtnClicked() {
        print("LoginButtonClicked() called")
        kakaoAuthVM.handleKakaoLogin()
    }
    
    @objc func logoutBtnClicked() {
        print("LogoutButtonClicked() called")
        kakaoAuthVM.kakaoLogout()
    }

}

//#if DEBUG
//
//import SwiftUI
//
//struct RootViewControllerPresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        
//    }
//    
//    func makeUIViewController(context: Context) -> some UIViewController {
//        RootViewController()
//    }
//}
//
//struct RootViewControllerPresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        RootViewControllerPresentable()
//    }
//}
//
//#endif
