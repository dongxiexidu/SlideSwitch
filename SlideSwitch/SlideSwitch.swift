//
//  SlideSwitch.swift
//  SlideSwitch
//
//  Created by fashion on 2018/2/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

public var on = false
let paddingWidth : CGFloat = 7
var switchView  = UIView.init()

class SlideSwitch: UIView {

    // 1.先调用init frame 后调用 draw rect 方法
    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.white
        //放入开关的背景
        let bgview = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: self.frame.size.width, height: self.frame.size.height)))
        bgview.backgroundColor = UIColor.white
        bgview.alpha = 0.3
        bgview.layer.cornerRadius = 25
        bgview.layer.masksToBounds = true
        self.addSubview(bgview)
        
        //显示一个开关拨片
        switchView = UIView.init(frame: CGRect.init(x: paddingWidth, y: paddingWidth, width: (self.frame.size.width - paddingWidth * 2)*0.5, height: self.frame.size.height-2*paddingWidth))
        switchView.center = CGPoint.init(x: self.frame.size.width / 4, y: self.frame.size.height / 2)
        switchView.backgroundColor = UIColor.white
        switchView.layer.cornerRadius = 25
        switchView.layer.masksToBounds = true
        self.addSubview(switchView)
        
        //放入手势操作
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(SlideSwitch.pangesture(sender:)))
        self.addGestureRecognizer(panGesture)
    }
    
    // 1.先调用init frame 后调用 draw rect 方法
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOn() {
        switchView.center = CGPoint.init(x: self.frame.size.width/4, y: self.frame.size.height/2);
        on = true
    }
    
    func setOff() {
        switchView.center = CGPoint.init(x: self.frame.size.width*3/4, y: self.frame.size.height/2);
        on = false
    }
    
    func setOnWithAnimate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.setOn()
        })
    }
    
    func setOffWithAnimate() {
        UIView.animate(withDuration: 0.5, animations:{
            self.setOff()
        })
    }
    
    func isOn() -> Bool {
        return on
    }
    
    @objc func pangesture(sender:UIPanGestureRecognizer) {
        if (on) {
            switch sender.state {
            case UIGestureRecognizerState.began:
                break;
            case UIGestureRecognizerState.changed:
                if (sender.translation(in: self).x > 0 && sender.translation(in: self).x < self.frame.size.width / 2) {
                    UIView.animate(withDuration: 0.1, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width/4+sender.translation(in: self).x, y: switchView.center.y)
                    })
                }
                break;
            case UIGestureRecognizerState.cancelled: break
            case UIGestureRecognizerState.ended:
                if (sender.translation(in: self).x > self.frame.size.width/4) {
                    UIView.animate(withDuration: 0.3, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width*3/4, y: self.frame.size.height*0.5)
                    })
                    on = false
                }else {
                    UIView.animate(withDuration: 0.3, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width/4, y: self.frame.size.height*0.5);
                    })
                    on = true
                }
                break
            default:
                break
            }
        } else { // off ->on
            switch sender.state {
            case UIGestureRecognizerState.began:
                break
            case UIGestureRecognizerState.changed:
                if (sender.translation(in: self).x < 0 && sender.translation(in: self).x > -self.frame.size.width / 2) {
                    UIView.animate(withDuration: 0.1, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width*3/4+sender.translation(in: self).x, y: self.frame.size.height*0.5);
                    })
                }
                break;
            case UIGestureRecognizerState.cancelled: break
            case UIGestureRecognizerState.ended:
                if (sender.translation(in: self).x > -self.frame.size.width/4) {
                    UIView.animate(withDuration: 0.3, animations: {
                        
                        switchView.center = CGPoint.init(x: self.frame.size.width*3/4, y: self.frame.size.height*0.5)
                    })
                    on = false
                }else {
                    UIView.animate(withDuration: 0.3, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width/4, y: self.frame.size.height*0.5)
                    })
                    on = true
                }
                break
            default:
                break
            }
        }
    }
}

