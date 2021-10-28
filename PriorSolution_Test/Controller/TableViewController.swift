//
//  TableViewController.swift
//  PriorSolution_Test
//
//  Created by Pathompong Subtechitmanee on 27/10/2564 BE.
//

import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "cell"
    var characterNames = [String]()
    var characterStatus = [String]()
    var characterSpecies = [String]()
    var characterGender = [String]()
    var characterOrigin = [String]()
    var characterLocation = [String]()
    var characterImage = [String]()
    var resultTmp = [Any]()
    var lastLoadingPage = 1
    let smoothFactor = 40
    var lastPage = 9999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
    }
    
    func getAPI() {
        
        let strTemp = "?page=\(lastLoadingPage)"
        let urlString = "https://rickandmortyapi.com/api/character" + strTemp
        let url = URL(string: urlString)!
        let data = try? Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
        
        let lastpage = json?["info"] as? [String: Any]
        lastPage = lastpage!["pages"] as! Int
        
        let result = (json?["results"] as? [[String: Any]])!
        
        var charCount = 0
        for i in 0...result.count - 1 {
            resultTmp.append(result[i])
            charCount += 1
        }
        
        let results = resultTmp as? [[String: Any]]
        
        for index in results!.count - charCount...results!.count - 1 {
            let result = results![index]
            let name = result["name"] as? String
            let status = result["status"] as? String
            let species = result["species"] as? String
            let gender = result["gender"] as? String
            let origin = result["origin"] as? [String: Any]
            let location = result["location"] as? [String: Any]
            let image = result["image"] as? String
            let originName = origin!["name"] as? String
            let locationName = location!["name"] as? String
            
            characterNames.append(name!)
            characterStatus.append(status!)
            characterSpecies.append(species!)
            characterGender.append(gender!)
            characterOrigin.append(originName ?? "no origin")
            characterLocation.append(locationName ?? "no location")
            characterImage.append(image ?? "")
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = characterNames[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCharacterInformation", sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if resultTmp.count < indexPath.row + smoothFactor {
            if lastLoadingPage >= lastPage {
                return
            }
            lastLoadingPage += 1
            getAPI()
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterInformation" {
            if let destination = segue.destination as? ViewController {
                destination.title = characterNames[sender as! Int]
                destination.name = characterNames[sender as! Int]
                destination.status = characterStatus[sender as! Int]
                destination.species = characterSpecies[sender as! Int]
                destination.gender = characterGender[sender as! Int]
                destination.origin = characterOrigin[sender as! Int]
                destination.location = characterLocation[sender as! Int]
                destination.image = characterImage[sender as! Int]
            }
        }
    }
    

}
