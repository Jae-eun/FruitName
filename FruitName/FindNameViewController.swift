//
//  FindNameViewController.swift
//  FruitName
//
//  Created by 이재은 on 19/12/2018.
//  Copyright © 2018 이재은. All rights reserved.
//

import UIKit
import Vision

class FindNameViewController: UIViewController {

    let imageModel = ImageClassifier()
    let imageName = "sfs"
    
    @IBOutlet weak var predictImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    func predictName() {
        guard let image: UIImage = UIImage(named: imageName),
            let pixelBuffer: CVPixelBuffer = image.pixelBuffer(width: Int(image.size.width), height: Int(image.size.height))
            else { return }
        
        if let result = try? imageModel.prediction(image: pixelBuffer) {
            let predictedLabel = result.classLabel
            let confidence = result.classLabelProbs[result.classLabel] ?? 0.0
            predictImageView.image = UIImage(named: imageName)
            resultLabel.text = "\(predictedLabel), \(confidence)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        predictName()
        // Do any additional setup after loading the view.
    }
}
