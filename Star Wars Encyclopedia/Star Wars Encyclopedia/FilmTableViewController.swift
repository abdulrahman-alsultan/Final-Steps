//
//  FilmTableViewController.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 21/12/2021.
//

import UIKit

class FilmTableViewController: UITableViewController {
    
    var filmsList: [Result]? = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarModel.getAllFilms(completionHandler: {
            data, response, error in
            
            guard let myData = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(FilmsInfo.self, from: myData)

                self.filmsList = jsonResult.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        })
        
            
        self.tableView.dataSource = self
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList?.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        
        cell.textLabel?.text = filmsList?[indexPath.row].title ?? ""
        
        return cell
    }

}
