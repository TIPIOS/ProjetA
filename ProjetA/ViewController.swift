//
//  ViewController.swift
//  ProjetA
//
//  Created by Luc Derosne on 08/10/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pseudo_ui: UITextField!
    
    let shared = UserDefaults(suiteName: "group.com.ac10qt.tipios04")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserdef()
        
    }

    private func getUserdef()
    {
        let shared = UserDefaults(suiteName: "group.com.ac10qt.tipios04")
        let valueForKey = shared?.object(forKey: "pseudo")
        guard let myPseudo: String = valueForKey as? String else { return }
        pseudo_ui.text = myPseudo
        print("Pseudo :  ", valueForKey ?? "")
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let myPseudo = pseudo_ui.text else { return }
        shared?.set(myPseudo, forKey: "pseudo")
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        pseudo_ui.text = ""
        shared?.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        
    }
}

