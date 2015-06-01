//
//  ViewController.swift
//  htmlparser
//
//  Created by Jiahao Lin on 01/06/2015.
//  Copyright (c) 2015 Jiahao Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageUrl: String = ""
    
    @IBOutlet weak var imageURL: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: UIButton) {
    
        var altStringToSearch:String = "I want to make a cake and then prepare coffee"
        let altSearchTerm:String = "cake"
        let altScanner = NSScanner(string: altStringToSearch)
        var altResult:NSString?
        altScanner.scanUpToString(altSearchTerm, intoString:&altResult) // altResult : "I want to make a "
        var len = altResult!.length
        var someString = (altStringToSearch as NSString).substringFromIndex(len)
        println(someString)
        let altSearchTerm2:String = "prepare"
         let altScanner2 = NSScanner(string: someString)
        altScanner.scanUpToString(altSearchTerm2, intoString:&altResult)
        println(altResult!)
        
        
        var realURL: String = "http://www.selfridges.com/en/ralph-lauren-new-fit-bi-swing-windbreaker-jacket_434-88064526-A30J4030Y3177/?previewAttribute=Rl+black"
        if let myURL = NSURL(string: realURL) {
            var error: NSError?
            var myHTMLString = NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error)
            
            if let error = error {
                println("Error : \(error)")
            } else {
               //  println("HTML : \(myHTMLString)")
                println("success")
             
                let altSearchTerm:String = "<div class=\"productImage\">"
                let altScanner = NSScanner(string: myHTMLString! as String)
                var altResult:NSString?
                altScanner.scanUpToString(altSearchTerm, intoString:&altResult)
                  var len2 = altResult!.length
               // println(len2)
                var someString = (myHTMLString! as NSString).substringFromIndex(len2)
                //println(someString)
                let altSearchTerm2:String = "/>"
                let altScanner2 = NSScanner(string: someString)
                 var altResult22:NSString?
                altScanner.scanUpToString(altSearchTerm2, intoString:&altResult22)
             //   println(altResult22!)
                
                
                let altSearchTerm222:String = "src=\""
                let altScanner3 = NSScanner(string: altResult22! as String)
                var altResult5:NSString?
                altScanner3.scanUpToString(altSearchTerm222, intoString:&altResult5)
                var len22 = altResult5!.length
                //println(len22)
                var someString2 = (altResult22! as NSString).substringFromIndex(len22+5)
                //println(someString2)
                let altSearchTerm3:String = "\""
                let altScanner4 = NSScanner(string: someString2)
                altScanner4.scanUpToString(altSearchTerm3, intoString:&altResult5)
               println(altResult5!)
                
imageUrl = altResult5! as String
                
            }
        } else {
            println("Error: \(realURL) doesn't seem to be a valid URL")
        }
    /*
        NSString *url = nil;
        NSString *htmlString = ...
        NSScanner *theScanner = [NSScanner scannerWithString:htmlString];
        // find start of IMG tag
        [theScanner scanUpToString:@"<img" intoString:nil];
        if (![theScanner isAtEnd]) {
            [theScanner scanUpToString:@"src" intoString:nil];
            NSCharacterSet *charset = [NSCharacterSet characterSetWithCharactersInString:@"\"'"];
            [theScanner scanUpToCharactersFromSet:charset intoString:nil];
            [theScanner scanCharactersFromSet:charset intoString:nil];
            [theScanner scanUpToCharactersFromSet:charset intoString:&url];
            // "url" now contains the URL of the img
        }
        */
    }
    
    @IBAction func displayImage(sender: UIButton) {
        let url = NSURL(string: imageUrl)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        imageURL.image = UIImage(data: data!)
    }
    
    
}

