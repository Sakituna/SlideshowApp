//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Sakiko Watanabe on 2021/07/15.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var showImage: UIImageView!
    
    var tapImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        showImage.image = tapImage
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
