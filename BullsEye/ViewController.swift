//
//  ViewController.swift
//  BullsEye
//
//  Created by Fritz Ebner on 12/12/18.
//  Copyright © 2018 Fritz Ebner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func knockKnock() {
        let alert = UIAlertController(title: "Who the hell is there!", message: "yeah, who is it", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "nothing", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello Fudgy!", message: "This is my first effing try", preferredStyle: .alert)
        let action = UIAlertAction(title: "Wow", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

