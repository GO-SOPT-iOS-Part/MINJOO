//
//  Cell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/03.
//

import UIKit

struct Poster {
    let image: UIImage
    var name: String? = nil
    var subName: String? = nil
    let sectionNum: Int
}

//extension Poster {
//    static func dummy() -> [Poster] {
//        var posters: [Poster] = []
//        for poster in 1...5 {
//            posters.append(Poster(image: UIImage(named: "poster_\(poster)")!,label: "\(poster)" ))
//        }
//        return posters + posters
//    }
//}

extension Poster {
    static func dummy() -> [[Poster]] {
        let poster = [[Poster(image: .poster_1, sectionNum: 0),
                       Poster(image: .poster_2, sectionNum: 0),
                       Poster(image: .poster_3, sectionNum: 0),
                       Poster(image: .poster_4, sectionNum: 0)],
                        [Poster(image: .poster_5, name: "반지의 제왕", sectionNum: 1),
                         Poster(image: .poster_1, name: "시그널", sectionNum: 1),
                         Poster(image: .poster_1, name: "해리포터", sectionNum: 1),
                         Poster(image: .poster_1, name: "스즈메의 문단속", sectionNum: 1),
                         Poster(image: .poster_1, name: "청춘MT", sectionNum: 1)],
                        [Poster(image: .poster_1, sectionNum: 3),
                         Poster(image: .poster_1, sectionNum: 3),
                         Poster(image: .poster_1, sectionNum: 3)],
                        [Poster(image: .poster_1, name: "tvN Show", subName: "신서유기5 10화\n24.3%", sectionNum: 4),
                         Poster(image: .poster_1, name: "JTBC", subName: "JTBC 뉴스\n10.7%", sectionNum: 4),
                         Poster(image: .poster_1, name: "tvN", subName: "부산 촌놈 3화\n7.4%", sectionNum: 4)],
                        [Poster(image: .poster_1, name: "그리스: 라이즈 오브 핑크 레이디스", sectionNum: 5),
                         Poster(image: .poster_1, name: "옐로우재킷 시즌2", sectionNum: 5),
                         Poster(image: .poster_1, name: "래빗홀", sectionNum: 5),
                         Poster(image: .poster_1, name: "메이어 오브 킹스타운", sectionNum: 5),
                         Poster(image: .poster_1, name: "1923", sectionNum: 5)]]

        return poster
    }

    static func sectionName() -> [String] {
        return ["", "티빙에서 꼭 봐야하는 콘텐츠", "", "인기 LIVE 채널", "파라마운트+의 따끈한 신작"]
    }

    static func sectionLayout() -> [String] {
        return ["Header", "Normal", "Banner", "Live", "Normal"]
    }
}


//struct PosterSection {
//    let items: [Poster]
//    let header: String?
//
//    static func dummy() -> [PosterSection] {
//        return [
//            PosterSection(items: [Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "이용권"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "1:1 문의내역"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "예약알림"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "회원정보 수정"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "프로모션 정보 수신 동의")], header: nil),
//
//            PosterSection(items: [Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "공지사항"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "이벤트"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "고객센터"),
//                                  Poster(image: UIImage(named: "poster_\(Poster.label)")!, label: "티빙 알아보기")], header: nil)
//        ]
//    }
//}
