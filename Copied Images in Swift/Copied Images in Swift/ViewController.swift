//
//  ViewController.swift
//  Copied Images in Swift
//
//  Created by Can Balkaya on 4/3/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    lazy var imageView = UIImageView()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])

        let image = UIImage(named: "example.tif")!
        let renderedImage = redraw(for: image)
        imageView.image = renderedImage
    }

    // MARK: - Methods
    func redraw(for image: UIImage) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: image.size)

        return renderer.image { _ in
            image.draw(at: .zero)
        }
    }
}
