//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 20/12/2021.
//

import UIKit


class PeopleViewController: UITableViewController{
    
    var people: [String]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")

        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            data, response, error in
            guard let myData = data else { return }
            
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: myData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{

                    if let results = jsonResult["results"]{
                        let resultsArray = results as! NSArray
                        for result in resultsArray{
                            let person = result as! NSDictionary
                            guard let name = person["name"] as? String else { return }
                            self.people?.append(name)
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }catch{
                print(error)
            }
        })
        task.resume()
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
            cell.textLabel?.text = people? [indexPath.row] ?? ""
            // return the cell so that it can be rendered
            return cell
        }

}

