//
//  DetailViewController.swift
//  Projects1-3
//
//  Created by Mikhail Strizhenov on 09.04.2020.
//  Copyright © 2020 Mikhail Strizhenov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var flagImage: UIImageView!
    var flagNumber: Int?
    var numberOfFlags: Int?
    var selectedFlag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let X = flagNumber, let Y = numberOfFlags {
            title = "Flag \(X) of \(Y)"
        }
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let flagToLoad = selectedFlag {
            flagImage.image = UIImage(named: flagToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = flagImage.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: ["\(selectedFlag!)", image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
