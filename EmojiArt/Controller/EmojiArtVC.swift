//
//  ViewController.swift
//  EmojiArt
//
//  Created by Matt Deuschle on 10/7/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class EmojiArtVC: UIViewController, UIDropInteractionDelegate {

    @IBOutlet private weak var dropView: UIView! {
        didSet {
            dropView.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    @IBOutlet private weak var emojiArtView: EmojiArtView!

    var imageFetcher: ImageFetcher!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) &&
            session.canLoadObjects(ofClass: UIImage.self)
    }

    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher() { url, image in
            DispatchQueue.main.async {
                self.emojiArtView.backgroundImage = image
            }
        }

        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first as? URL {
                self.imageFetcher.fetch(url)
            }
        }

        session.loadObjects(ofClass: UIImage.self) { images in
            if let image = images.first as? UIImage {
                self.imageFetcher.backup = image
            }
        }
    }
}







