//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Yixin Xue on 1/30/17.
//  Copyright © 2017 Yixin Xue. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlFile = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
            webView.load(htmlData as! Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
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
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

}
