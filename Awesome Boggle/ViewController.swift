//
//  ViewController.swift
//  Awesome Boggle
//
//  Created by Neem Serra on 8/2/17.
//  Copyright © 2017 Neem Serra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var boggleView: BoggleView?
    var boggleModel: BoggleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boggleView = view as? BoggleView
        boggleView?.delegate = self
        boggleModel = BoggleModel()
        resetButtonTitles()
    }

    func resetButtonTitles() {
        let numberOfButtons = boggleView?.buttons.count
        
        if let model = boggleModel, let numberOfButtons = numberOfButtons {
            let titleArray = model.lettersArray(numberOfLetters: numberOfButtons)
            boggleView?.setButtonTitles(titleArray)
        }
    }
}

extension ViewController: BoggleViewProtocol {
    func resetButtonPressed() {
        resetButtonTitles()
        boggleModel?.resetAllTheWords()
    }
    
    func saveWord(word: String) {
        if let currentWords = boggleModel?.addWord(word: word) {
            boggleView?.setAllWordsLabelText(currentWords)
        }
    }
}











