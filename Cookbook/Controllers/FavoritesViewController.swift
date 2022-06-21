//
//  FavoritesViewController.swift
//  Cookbook
//
//  Created by Jafar Asimov on 6/21/22.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleUpdateFavorites), name: .updateFavorites, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc
    func handleUpdateFavorites(_ notification: Notification) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FavoritesToSecondDetails",
           let vc = segue.destination as? SecondViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            vc.dessert = desserts[indexPath.row]
            vc.navigationItem.rightBarButtonItem?.customView?.isHidden = true
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DessertCell
        cell.configureCell(dessert: favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
     
    

}
