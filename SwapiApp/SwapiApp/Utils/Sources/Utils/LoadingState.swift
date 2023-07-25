//
//  LoadingState.swift
//  
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import Foundation

public enum LoadingState<Value> {

    case loading
    case failed(Error)
    case loaded(Value)
}
