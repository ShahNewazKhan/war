//
//  ViewController.swift
//  War
//
//  Created by Shah on 1/6/15.
//  Copyright (c) 2015 COMP4977. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var lblPlayerScore: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblCompScoer: UILabel!
    
    var playerCount:Int = 0
    var compCount:Int = 0
    var clickCount:Int = 0
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
    }

    override func didReceiveMemoryWarning() 
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playRoundPressed(sender: UIButton) 
    {
        
        // Randomize a number for first card
        var card1 = arc4random_uniform(13) + 1
        var card1str = String(format: "card%i", card1)
        
        // Randomize a number for second card
        var card2 = arc4random_uniform(13) + 1
        var card2str = String(format: "card%i", card2)
        
        // Add image to card 1 & 2 
        self.firstCardImageView.image = UIImage( named: card1str )
        self.secondCardImageView.image = UIImage( named: card2str )
        
        // Determine winner
        
        if card1 > card2 {
            
            lblPlayerScore.text = String(++playerCount)
            lblResult.text = "You win"
            
        }
        else if card1 == card2{
            
            lblResult.text = "Tie"
        }
        else{
            
            lblCompScoer.text = String (++compCount)
            lblResult.text = "Comp wins"
        }
        
        showAd()
    
    }
    
    func showAd()
    {
        clickCount++
        
        if ( clickCount == 10 )
        {
            self.canDisplayBannerAds = false
        }
                
    }
}

