//
//  TestManager.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/16/22.
//

import Foundation

class TestManager : ObservableObject {
    static let shared = TestManager()
    
    @Published var isKTK3set: Bool = false
    @Published var isPHVset: Bool = false
    @Published var isSitAndReachset: Bool = false
    @Published var isFatPercentageset: Bool = false
    @Published var isTTestset: Bool = false
    @Published var isOneLegStanceset: Bool = false
    @Published var isTenTwentyThirtyFiveset: Bool = false
    @Published var isTenxFiveset: Bool = false
    @Published var isShuttleRunset: Bool = false
    @Published var isYoYoset: Bool = false
    @Published var isFSTset: Bool = false
    @Published var isLSPTset: Bool = false
    @Published var isInsaitJoyset: Bool = false
    @Published var isGiTset: Bool = false
}
