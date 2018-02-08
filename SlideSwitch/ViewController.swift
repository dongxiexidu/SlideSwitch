//
//  ViewController.swift
//  SlideSwitch
//
//  Created by fashion on 2018/2/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width
let padding : CGFloat = 50

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    func initView() -> (){
        self.view.backgroundColor = UIColor.init(red: 0/255, green: 171/255, blue: 253/255, alpha: 1)
        let slideSwitch = SlideSwitch.init(frame: CGRect.init(x: padding, y: 2*padding, width: (kScreenWidth-2*padding), height: (kScreenWidth-2*padding)*0.5))
        slideSwitch.backgroundColor = UIColor.clear
        self.view.addSubview(slideSwitch)
        slideSwitch.setOnWithAnimate()
    }


}

