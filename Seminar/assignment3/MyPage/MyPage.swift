//
//  MyPage.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/26.
//


import UIKit

struct MyPage {
    let label: String
}

struct SettingSection {
    let items: [MyPage]
    
    static func dummy() -> [SettingSection] {
        return [
            SettingSection(items: [MyPage(label: "이용권"),
                                   MyPage(label: "1:1 문의내역"),
                                   MyPage(label: "예약알림"),
                                   MyPage(label: "회원정보 수정"),
                                   MyPage(label: "프로모션 정보 수신 동의")]),
            
            SettingSection(items: [MyPage(label: "공지사항"),
                                   MyPage(label: "이벤트"),
                                   MyPage(label: "고객센터"),
                                   MyPage(label: "티빙 알아보기")])
        ]
    }
}

