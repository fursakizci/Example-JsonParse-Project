

import UIKit


class TableViewController: UITableViewController {

    var arr = [[String:Any]]()
    var arr2 = [String]()
    var damagearray = [[String:String]]()
   // var hasar1 = [[String:String]]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        json()
    }
    
    func json(){
        guard let path = Bundle.main.path(forResource: "hasar_aninda_yapilacaklar2", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
            //print(json)
            //print(json)
            guard let hasarlararr = json?["hasarlar"] as? [[String:Any]]else{return}
            
            for count in hasarlararr{
            guard let typeDict = count as? [String:Any]else{return}
            guard let type = typeDict["type"] as? String else {return}
            arr2.append(type)
                }
            
            arr = hasarlararr
            
            //array2 = array
        }
        catch {
            print(error)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return arr.count
            //arr2.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arr[section]["damage_types"] as! [[String:String]]).count
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        
        
        
        //arr2[indexPath.row]
        damagearray = arr[indexPath.section]["damage_types"] as! [[String:String]]
        //print(damagearray.count)
        let damageDict = damagearray[indexPath.row]
        // print(damageDict)
        cell.titleLabel.text = damageDict["damage_type"]
        cell.subtitleLabel.text = damageDict["description"]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerLabel1 = UILabel()
        headerLabel1.text = arr2[section]
        headerLabel1.numberOfLines = 0
        headerLabel1.backgroundColor = UIColor.black
        headerLabel1.textColor = UIColor.white
        return headerLabel1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    }
  


