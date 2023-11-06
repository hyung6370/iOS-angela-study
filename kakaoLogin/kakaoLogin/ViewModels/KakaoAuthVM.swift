//
//  KakaoAuthVM.swift
//  kakaoLogin
//
//  Created by KIM Hyung Jun on 11/6/23.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((Error) -> Void)?
    var onLogoutSuccess: (() -> Void)?
    
    init() {
        print("KakaoAuthVM - handleKakaoLogin() called")
    }
    
    func handleKakaoLogin() {
        print("KakaoAuthVM - handleKakaoLogin() called")
        
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                if let error = error {
                    print(error)
                    self?.onLoginFailure?(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    self?.onLoginSuccess?()
                    //do something
                    _ = oauthToken
                }
            }
        }
        else { // 카톡이 설치가 안되어 있으면
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self?.onLoginSuccess?()
                    //do something
                    _ = oauthToken
                }
            }
        }
    } // Login
    
    func kakaoLogout() {
        UserApi.shared.logout { [weak self] (error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                DispatchQueue.main.async {
                    self?.onLogoutSuccess?()
                }
            }
        }
    }
}
