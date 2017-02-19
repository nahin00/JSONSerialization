//
//  ViewController.swift
//  JSONSerialization
//
//  Created by Nahin Ahmed on 2/19/17.
//  Copyright © 2017 Nahin Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.adorable.io/avatars/list")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print("Error")
            } else {
                
                if let allData = data{
                    do{
                        let allJSONData = try JSONSerialization.jsonObject(with: allData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        // Prints all JSON data
                        
                        print(allJSONData)
                        
                        if let face = allJSONData["face"] as AnyObject? {
                            
                            // Prints face
                            
                            print(face)
                            
                            if let eyes = face["eyes"] as! NSArray? {
                                
                                // Prints eyes
                                
                                print(eyes)
                                
                                for i in 0..<3 {
                                    
                                    // Prints first 3 eyes
                        
                                    print(eyes[i])
                                }
                            }
                        }
                    } catch {
                        
                    }
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

