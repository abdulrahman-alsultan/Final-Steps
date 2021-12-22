//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 20/12/2021.
//

import UIKit


class PeopleViewController: UITableViewController{
    
    var people: [FilmResult]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        StarWarModel.getAllPeople(completionHandler: {
            data, response, error in
            
            guard let myData = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(People.self, from: myData)

                self.people = jsonResult.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        })
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create a generic cell
            let cell = UITableViewCell()
            // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people?[indexPath.row].name
            // return the cell so that it can be rendered
            return cell
        }

}

