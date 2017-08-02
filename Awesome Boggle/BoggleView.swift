//
//  BoggleView.swift
//  Awesome Boggle
//
//  Created by Neem Serra on 8/2/17.
//  Copyright © 2017 Neem Serra. All rights reserved.
//

import Foundation
import UIKit

protocol BoggleViewProtocol: class {
    func resetButtonPressed()
    func saveWord(word: String)
}
class BoggleView: UIView {
    weak var delegate: BoggleViewProtocol?
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var allTheWordsLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    func setButtonTitles(_ buttonTitles: [String]) {
        var arrayPlace = 0
        for button in buttons {
            button.setTitle(buttonTitles[arrayPlace], for: .normal)
            arrayPlace += 1
        }
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("hi")
        delegate?.resetButtonPressed()
        allTheWordsLabel.text = ""
        wordLabel.text = ""
    }
    

    @IBAction func letterTapped(_ sender: UIButton) {
        let letter = sender.titleLabel?.text
        if let wordLabel = wordLabel,
            let wordLabelText = wordLabel.text,
            let letter = letter {
            wordLabel.text = wordLabelText + letter
        }

    }
    
    @IBAction func enterTapped(_ sender: UIButton) {
        if let word = wordLabel.text {
            delegate?.saveWord(word:word)
        }
        
        wordLabel.text = ""
    }
    
    func setAllWordsLabelText(_ words: [String]) {
        allTheWordsLabel.text = words.joined(separator: ", ")
    }
}
