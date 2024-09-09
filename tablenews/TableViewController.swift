//
//  TableViewController.swift
//  tablenews
//
//  Created by iskapc on 05.09.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var news_list = [
        News(
            title: "Новые тенге: Нацбанк предупредил казахстанцев",
            text: "Национальный банк Казахстана предупреждает о фактах распространения в социальных сетях и мессенджерах рекламы, предлагающей приобрести полиграфическую продукцию, имитирующую внешние признаки подлинных банкнот, в том числе из новой серии \"Сакский стиль\" и юбилейной банкноты номиналом 10 000 тенге",
            imageName: "tenge",
            publicationDate: "2024-09-09 20:12:00"
        ),
        News(
            title: "В Алматы проведут неделю чистоты в преддверии Дня города",
            text: "В Алматы в преддверии Дня города с 9-го по 13 сентября в рамках городской кампании \"Алматы – наш общий дом\" и республиканской программы \"Таза Қазақстан\" пройдет масштабная работа по уборке улиц, приведению в порядок городской инфраструктуры, дворовых территорий, детских площадок, фонтанов, набережных рек и водоемов, парков, скверов и предгорий.",
            imageName: "almaty",
            publicationDate: "2024-09-09 20:12:00"
        ),
        News(
            title: "Токаев встретился с генсеком Всемирной туристской организации ООН",
            text: "Глава государства принял генерального секретаря Всемирной туристской организации ООН Зураба Пололикашвили, передает Tengrinews.kz со ссылкой на сообщение пресс-службы Акорды.",
            imageName: "tur",
            publicationDate: "2024-09-09 20:12:00"
        )
    ]
    
    let timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

    }

    // MARK: - Table view data source
    func getCurrentDateString() -> String {
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateString = dateFormatter.string(from: currentDate)
        print(dateString)
        return dateString
    }
    
    @objc func fireTimer() {
        news_list.insert(
            News(
                title: "New Some News",
                text: "New Some Text",
                imageName: "news",
                publicationDate: getCurrentDateString()
            ),
            at: 0)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news_list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)

        let labelTitle = cell.viewWithTag(1001) as! UILabel
        labelTitle.text = "\(news_list[indexPath.row].title)"
        
        let textView = cell.viewWithTag(1002) as! UITextView
        textView.text = "\(news_list[indexPath.row].text)"
        
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: news_list[indexPath.row].imageName)
        
        let labelDateString = cell.viewWithTag(1004) as! UILabel
        labelDateString.text = "\(news_list[indexPath.row].publicationDate)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
