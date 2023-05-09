//
//  NetworkResult.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//

import Foundation
//
//  NetworkResult.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)     // 서버 통신 성공
    case requestErr(T)  // 요청에러 발생
    case pathErr // 경로 에러
    case serverErr  // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}
