//
//  Box.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 20.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

class Box<T> {
    var listener: ((T) -> Void)?
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping (T) -> Void ) {
        self.listener = listener
        listener(value)
    }
}
