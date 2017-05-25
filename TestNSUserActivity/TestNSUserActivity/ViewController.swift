//
//  ViewController.swift
//  TestNSUserActivity
//
//  Created by panhongliu on 2017/5/24.
//  Copyright © 2017年 wangsen. All rights reserved.
//

import UIKit


struct SongInfo {
   
    let song:String
    let album:String
    let style:String

    
}
class ViewController: UIViewController ,UITableViewDelegate{

    fileprivate var songList: [SongInfo] = []
    //存储搜索item的标识符
    private var searchSongIdentifier: Int?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        //添加数据,SongInfo是一个模型类，仅仅是包含了3个属性和初始化方法
        songList.append(SongInfo(song: "Bob Dylan - Like a Rolling Stone", album: "Highway 61 Revisited (1965)", style: "Rock"))
        songList.append(SongInfo(song: "John Lennon - Imagine", album: "Imagine (1971)", style: "Rock, Pop"))
        songList.append(SongInfo(song: "Nirvana - Smells Like Teen Spirit", album: "Nevermind (1991)", style: "Rock"))
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
//        if let indexPath = tableView.indexPathForSelectedRow {
//            tableView.deselectRow(at: indexPath, animated: false)
//        }
        super.viewWillAppear(animated)
    }
    //当执行segue过渡时，会触发该方法，该方法主要是获取选中的位置，便于后续的搜索,以及页面跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        
        let  songId = searchSongIdentifier
       
        //设置对应的歌曲信息和位置
        let controller = segue.destination as! DetailedViewController
        controller.songInfo = songList[songId!]
        controller.songIndex = songId!
        
    }
    //判断activity中的userInfo字典中是否包含index作为key所对应的值，如果存在，存储对应的值到searchSongIdentifier，并进行跳转
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if let index = activity.userInfo?["index"] as? Int{
            searchSongIdentifier = index
            self.performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        searchSongIdentifier = indexPath.row
        self.performSegue(withIdentifier: "showDetail", sender: self)
        
        
    }

    

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "MyCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        cell!.textLabel!.text = songList[(indexPath as NSIndexPath).row].song
        return cell!
    }
   
    
}

