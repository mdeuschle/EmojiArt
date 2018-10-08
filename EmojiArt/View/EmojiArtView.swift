//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Matt Deuschle on 10/7/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
