//
//  RootTableViewController.swift
//  indoorApp
//
//  Created by Swetha on 12/9/24.
//

import Foundation
import UIKit
class RootTableViewController: UITableViewController {
    var activityArray = [activity]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let activityObject = activityArray[indexPath.row]
        
        let activityName = activityObject.activityName
        let level = activityObject.level
        let Image = activityObject.Image
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel!.text = activityName
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        
        cell.detailTextLabel!.text = level
        cell.imageView?.image = UIImage(named: "bullet.png")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showActivityDetails"{
            let indexPath = tableView.indexPathForSelectedRow
            let selectedActivityObject = activityArray[indexPath!.row]
            
            let destController = segue.destination as! ViewController
            
            destController.randomActivity = selectedActivityObject
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        populateactivityObjects()
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
        act3.level = "Intermediate"
        act3.activityDescription = "Try solving online puzzles or if you like the physical ones, try solving a simple cartoon puzzle.There’s something satisfying about finding that one piece that fits perfectly, clicking it into place, and watching the scene come to life bit by bit."
        act3.activityItem1 = "puzzle"
        act3.activityItem2 = "table"
        act3.activityItem3 = "patience;)"
        act3.website="https://www.jigsawplanet.com/"
        act3.Image = "puzzle.jpg"
        activityArray.append(act3)
        
        let act4 = activity()
        act4.activityName = "Lego"
        act4.level = "Easy"
        act4.activityDescription = "Grab some simple flower, or ur favorite disney character legos, and build it. Let your imagination guide each piece, carefully snapping the blocks together, watching your creation come to life. "
        act4.activityItem1 = "Lego"
        act4.activityItem2 = "table/plain surface"
        act4.activityItem3 = "Instruction manual"
        act4.website="https://www.lego.com/en-us/themes/adults-welcome/botanical-collection/flower-bouquet?age-gate=grown_up"
        act4.Image = "lego.png"
        activityArray.append(act4)
        
        let act5 = activity()
        act5.activityName = "Knit"
        act5.level = "Intermediate"
        act5.activityDescription = "Grab some yarn from your nearest craft shop and knit a simple scarf. As you knit, let your mind wander—perhaps to the person who will wear the scarf or the chilly days ahead where it will provide warmth and comfort."
        act5.activityItem1 = "Yarn"
        act5.activityItem2 = "Knitting needles"
        act5.activityItem3 = "Cozy spot"
        act5.website="https://nimble-needles.com/patterns/how-to-knit-a-scarf-for-beginners/"
        act5.Image = "knit.jpg"
        activityArray.append(act5)
        
        
    }
}
