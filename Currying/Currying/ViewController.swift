//
//  ViewController.swift
//  Currying
//
//  Created by Batu on 2016/11/24.
//  Copyright © 2016年 Batu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addTwo = addTo(2)
        let result = addTwo(6)
        print(result)
        
        let comparer10 = greaterThan(10)
        let com = comparer10(2)
        print(com)
    }
    
    func addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in
            return num + adder
        }
    }
    
    func greaterThan(_ comparer: Int) -> (Int) -> Bool {
        return {
//            num in
//            return num > comparer
            $0 > comparer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

