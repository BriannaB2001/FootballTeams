//
//  FootballTrackerTableViewController.swift
//  FootballTeamCodeChallenge
//
//  Created by Brianna Babcock on 10/12/20.
//

import UIKit

class TeamTableViewCells: UITableViewCell {
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var winsTextField: UITextField!
 }

class FootballTableViewController: UITableViewController {
    
    var footballTeams = [FootballTeam]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamTableViewCells
        let team = footballTeams[indexPath.row]
        cell!.teamNameLabel?.text = team.teamName
        cell!.winsTextField?.text = team.wins
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            footballTeams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
        if let addTeamVC = (unwindSegue.source as? FootballTeamAdderViewController), let newTeam = addTeamVC.team {
            footballTeams.append(newTeam)
            tableView.reloadData()
        }
    }
}
