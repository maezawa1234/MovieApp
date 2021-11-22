//
//  ArrayBuilder.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/22.
//

import Foundation

@resultBuilder
struct ArrayBuilder<T> {
    static func buildBlock(_ components: T...) -> [T] {
        components
    }
}
