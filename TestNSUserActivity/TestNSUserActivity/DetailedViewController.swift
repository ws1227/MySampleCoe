import UIKit

class DetailedViewController: UIViewController,NSUserActivityDelegate {
    
    var songInfo: SongInfo!
    var songIndex: Int?
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songLabel.text = songInfo.song
        albumLabel.text = songInfo.album
        styleLabel.text = songInfo.style
        
        //创建NSUserActivity对象，activityType代表activity的类型，值为reverse-DNS format。该值与nfo.plist值保持一致
        let activity = NSUserActivity(activityType: "com.TestNSUserActivity")
        //activity的名称，当搜索的时候，我们可以看到对应的title
        activity.title = songInfo.song
        //在设置title之后，我们可以搜索title，为了提高搜索效果，所有设置一系列局部关键字帮助用户在搜索结果中找到activity
        var keywords = songInfo.song.components(separatedBy: "")
        keywords.append(songInfo.album)
        keywords.append(songInfo.style)
        activity.keywords = Set(keywords)
        //该布尔值确定是否能够使用Handoff在其它设备使用该activity
        activity.isEligibleForHandoff = true
        //是否应该被添加到设备index
        activity.isEligibleForSearch = true
        //是否能够被所有的IOS公众用户访问
        activity.isEligibleForPublicIndexing = true
        //设置代理
        activity.delegate = self
        //是否activity需要被更新，如果为真，在activity被发送之前触发代理方法
        activity.needsSave = true
        
        //为了避免再indexing之前被释放，需要复制当前创建的activity带全局的userActivity（在UIResponder类中声明）。在创建之后，我们必须添加activity到设备的索引用于搜索结果
        userActivity = activity
        //标记userActivity为当前使用的activity
        userActivity?.becomeCurrent()
    }
    
    //通知代理用户的activity将被存储，存储用户点击的index，用于点击搜索的内容定位具体的详情页面
    func userActivityWillSave(_ userActivity: NSUserActivity) {
        userActivity.userInfo = ["index" : songIndex!]
    }
}
