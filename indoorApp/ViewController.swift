//
//  ViewController.swift
//  indoorApp
//
//  Created by Swetha on 10/27/24.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var item3switch: UISwitch!
    @IBOutlet weak var item2switch: UISwitch!
    @IBOutlet weak var item1switch: UISwitch!
    @IBOutlet weak var lblitem3: UILabel!
    @IBOutlet weak var lblitem2: UILabel!
    @IBOutlet weak var lblitem1: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var lblwebpage: UILabel!

    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var level: UILabel!
    //initialisation
    var selectedActivity: activity?
    var mySoundFile: AVAudioFile!
    var audioPlayer: AVAudioPlayer!
    var activityArray = [activity]()
    var randomActivity = activity() //this is not random
    @IBAction func value1(_ sender: Any) {
        if (item1switch.isOn && item2switch.isOn && item3switch.isOn){
            UserDefaults.standard.set(lblName.text, forKey: "All set")
        }
        else{
            UserDefaults.standard.set("", forKey: "All set")
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
        setLabel()
    }
    @IBAction func btnResource(_ sender: Any) {
        let browserApp = UIApplication.shared
                
                let url = URL(string: randomActivity.website)
                
                browserApp.open(url!)
    }
    func setLabel(){
        if audioPlayer != nil {
                audioPlayer?.play() // Play the audio
            } else {
                print("Audio player is not initialized.")
            }
        //randomActivity = activityArray.randomElement()!
        lblName.text = randomActivity.activityName
        txtDescription.text = randomActivity.activityDescription
        lblitem1.text = randomActivity.activityItem1
        lblitem2.text = randomActivity.activityItem2
        lblitem3.text = randomActivity.activityItem3
        Image.image = UIImage(named: randomActivity.Image)
        
        //checklist data
        let all = UserDefaults.standard.string(forKey: "All set")
        item1switch.isOn = (randomActivity.activityName == all )
        item2switch.isOn = (randomActivity.activityName == all )
        item3switch.isOn = (randomActivity.activityName == all )
        
        
        //decorate the controls
        txtDescription.layer.cornerRadius = 15
        txtDescription.layer.borderColor = UIColor.brown.cgColor
        //image decoration
        Image.layer.cornerRadius = 35
        Image.layer.borderColor = UIColor.brown.cgColor
        Image.layer.borderWidth = 2
        Image.contentMode = .scaleAspectFill
        
    }
    
    func populateactivityObjects(){
        let act1 = activity()
        act1.activityName = "Bake"
        act1.level = "Intermediate"
        act1.activityDescription = "Make a simple butter cookies, with minimal ingredients and less effort.These cookies need no frosting or extras—they’re simple, satisfying, and perfect for a quick treat or a cozy moment with a cup of tea."
        act1.activityItem1 = "Flour"
        act1.activityItem2 = "Sugar"
        act1.activityItem3 = "Butter"
       act1.website="https://thegardeningfoodie.com/3-ingredient-butter-cookies/"
        act1.Image = "bake.jpg"
        activityArray.append(act1)
        
        let act2 = activity()
        act2.activityName = "Read"
        act2.level = "Easy"
        act2.activityDescription = "Grab a book from the nearest library or bookstore, and read it.Let yourself sink into the pages, leaving behind the world around you as you dive into a new one"
        act2.activityItem1 = "book"
        act2.activityItem2 = "coffee"
        act2.activityItem3 = "cozy spot"
        act2.website="https://www.rd.com/list/books-read-before-die/"
        act2.Image = "read.jpg"
        activityArray.append(act2)
        
        let act3 = activity()
        act3.activityName = "Puzzle"
        act2.level = "Intermediate"
        act3.activityDescription = "Try solving online puzzles or if you like the physical ones, try solving a simple cartoon puzzle.There’s something satisfying about finding that one piece that fits perfectly, clicking it into place, and watching the scene come to life bit by bit."
        act3.activityItem1 = "puzzle"
        act3.activityItem2 = "table"
        act3.activityItem3 = "patience;)"
        act3.website="https://www.jigsawplanet.com/"
        act3.Image = "puzzle.jpg"
        activityArray.append(act3)
        
        let act4 = activity()
        act4.activityName = "Lego"
        act2.level = "Easy"
        act4.activityDescription = "Grab some simple flower, or ur favorite disney character legos, and build it. Let your imagination guide each piece, carefully snapping the blocks together, watching your creation come to life. "
        act4.activityItem1 = "Lego"
        act4.activityItem2 = "table/plain surface"
        act4.activityItem3 = "Instruction manual"
        act4.website="https://www.lego.com/en-us/themes/adults-welcome/botanical-collection/flower-bouquet?age-gate=grown_up"
        act4.Image = "lego.png"
        activityArray.append(act4)
        
        let act5 = activity()
        act5.activityName = "Knit"
        act2.level = "Intermediate"
        act5.activityDescription = "Grab some yarn from your nearest craft shop and knit a simple scarf. As you knit, let your mind wander—perhaps to the person who will wear the scarf or the chilly days ahead where it will provide warmth and comfort."
        act5.activityItem1 = "Yarn"
        act5.activityItem2 = "Knitting needles"
        act5.activityItem3 = "Cozy spot"
        act5.website="https://nimble-needles.com/patterns/how-to-knit-a-scarf-for-beginners/"
        act5.Image = "knit.jpg"
        activityArray.append(act5)
        
        
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        Image.alpha = 0.0
        lblName.alpha = 0.0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 3, animations: {
            self.Image.alpha = 1
            self.lblName.alpha = 1
            
        })
    }
                       
        override func viewDidLoad() {
            item1switch.isOn = false
            item2switch.isOn = false
            item3switch.isOn = false
        super.viewDidLoad()
        populateactivityObjects()//initialise objects
            // Load the sound file
                    if let soundUrl = Bundle.main.url(forResource: "music", withExtension: "mp3") {
                        do {
                            mySoundFile = try AVAudioFile(forReading: soundUrl)
                            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl) // Initialize audioPlayer
                            audioPlayer.prepareToPlay() // Prepare for playback
                        } catch {
                            print("Error loading audio file: \(error.localizedDescription)")
                        }
                    } else {
                        print("Audio file not found in the bundle")
                    }

        setLabel()//set initial value on the labels
            
    }

    
}

