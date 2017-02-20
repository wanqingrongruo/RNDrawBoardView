//
//  ViewController.swift
//  RNDrawBoardView
//
//  Created by 婉卿容若 on 2017/2/20.
//  Copyright © 2017年 婉卿容若. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myPaletteInfo: (Bool, UIImage?) = (false, nil)
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBAction func skipToNext(_ sender: UIButton) {
        
        let paletteVC = RNPaletteViewController(callBack:{ paletteInfo in
            
            self.myPaletteInfo = paletteInfo
            
            DispatchQueue.main.async { // 回主线程更新 UI
                
                if let signImage = paletteInfo.1{
                    
                    // 渐进显示
                    let transition = CATransition()
                    transition.type = kCATransitionFade
                    transition.duration = 0.3
                    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                    self.signImageView.layer.add(transition, forKey: nil)
                    
                    self.signImageView.image = signImage
                }
               
            }
        })
        
        if myPaletteInfo.0 {
             paletteVC.paletteImage = signImageView.image
        }else{
             paletteVC.paletteImage = nil
        }
        
        navigationController?.pushViewController(paletteVC, animated: true)
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "VC"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
