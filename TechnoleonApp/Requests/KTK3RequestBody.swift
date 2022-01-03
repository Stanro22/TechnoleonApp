//
//  KTK3RequestBody.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation

final class KtK3RequestBody : ObservableObject {
    static let shared = KtK3RequestBody()
    
    var hoppingSideways1: Int? = 0
    var hoppingSideways2: Int? = 0
    var movingSideways1: Int? = 0
    var movingSideways2: Int? = 0
    var handEye1: Int? = 0
    var handEye2: Int? = 0
    var beam11: Int? = 0
    var beam12: Int? = 0
    var beam13: Int? = 0
    var beam21: Int? = 0
    var beam22: Int? = 0
    var beam23: Int? = 0
    var beam31: Int? = 0
    var beam32: Int? = 0
    var beam33: Int? = 0
}
