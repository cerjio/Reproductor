//
//  CancionTableViewController.swift
//  Reproductor
//
//  Created by cerjio on 25/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import UIKit
import AVFoundation

class CancionTableViewController: UITableViewController {
    
    var canciones : [Cancion] = []
    var cancionSeleccionada : String = ""
    
    private var reproductor : AVAudioPlayer!

    @IBOutlet var tableViewReference: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleSongs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return canciones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CancionTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CancionTableViewCell
        
        let cancion = canciones[indexPath.row]

        // Configure the cell...
        cell.nameLabel.text = cancion.nombreCancion.componentsSeparatedByString("-").first!
        cell.imageView?.image = cancion.portada
        

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*let sonidoURL = NSBundle.mainBundle().URLForResource(name: String?, withExtension: "mp3")*/
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
   
        
        
        let  cancionSeleccionada : String = canciones[(tableViewReference.indexPathForSelectedRow?.row)!].nombreCancion
        
        let sonidoURL = NSBundle.mainBundle().URLForResource(cancionSeleccionada, withExtension: "mp3")
   
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            reproductor.play()
        } catch {
            print("Error al cargar el archivo de sonido")
        }
        
        
        return true
    }

    
    
    func loadSampleSongs() {
        let portada1 = UIImage(named: "ava-adore")!
        let cancion1 = Cancion(nombreCancion: "Ava Adore - Smashing Pumpkins", portada: portada1)
        
        let portada2 = UIImage(named: "archie")!
        let cancion2 = Cancion(nombreCancion: "Dead Funny - Archie Bronson Outfit", portada: portada2)
        
        canciones += [cancion1, cancion2]
        

    }

}
