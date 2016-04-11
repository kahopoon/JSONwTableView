//
//  TableViewController.swift
//  JSONwTableView
//
//  Created by Ka Ho on 11/4/2016.
//  Copyright © 2016 Ka Ho. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {

    let data = NSData(contentsOfURL: NSURL(string: "https://kahopoon.net/temp.json")!)
    var rawData = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 600.0
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
    }

    func readJSONObject(object: [String: AnyObject]) {
        guard let results = object["result"] as? [[String: AnyObject]] else { return }
        for result in results {
            guard let imageUrl = result["imageUrl"] as? String, let title = result["title"] as? String, let description =  result["description"] as? String, let userInfo = result["user"] as? [String: AnyObject] else { break }
            
            rawData.append(["imageUrl":imageUrl, "title":title, "description":description, "name":userInfo["name"] as! String, "profilePicURL":userInfo["image_url"] as! String])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rawData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        let currentData : Dictionary = self.rawData[indexPath.row]
        let profile_url = NSURL(string: currentData["profilePicURL"]!)
        let photo_url = NSURL(string: currentData["imageUrl"]!)
        
        cell.profileName.text = currentData["name"]
        cell.profilePic.sd_setImageWithURL(profile_url, placeholderImage: nil)
        cell.imageShow.sd_setImageWithURL(photo_url, placeholderImage: nil)
        cell.titleShow.text = currentData["title"]
        cell.descriptionShow.text = currentData["description"]
        
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.orangeColor().colorWithAlphaComponent(0.1)
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
