//
//  ViewController.swift
//  kollus
//
//  Created by HyeonD on 2021/04/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, KollusStorageDelegate, KollusPlayerDelegate{
    
    let kollusStorage: KollusStorage = KollusStorage()
    
    let contentTableView = UITableView()
    
    var containerView:KollusPlayerView! = KollusPlayerView()
    
    var contentList: Array<Dictionary<String, Any?>> = [
        [
            "title": "8412410_01",
            "progress":  Float(0.0),
            "downloaded": false,
            "url": "https://v.jp.kollus.com/si?jwt=eyJhbGciOiAiSFMyNTYiLCJ0eXAiOiAiSldUIn0.eyJjdWlkIjoiZmlzaGluZyIsImV4cHQiOjMxODUyMTg2MDYsIm1jIjpbeyJtY2tleSI6InZBSTN1NmZEIiwic2VlayI6dHJ1ZSwiZHJtX3BvbGljeSI6eyJraW5kIjoiaW5rYSIsInN0cmVhbWluZ190eXBlIjoiaGxzIiwiZGF0YSI6eyJsaWNlbnNlX3VybCI6Imh0dHBzOi8vbGljZW5zZS5wYWxseWNvbi5jb20vcmkvbGljZW5zZU1hbmFnZXIuZG8iLCJjZXJ0aWZpY2F0ZV91cmwiOiJodHRwczovL2xpY2Vuc2UucGFsbHljb24uY29tL3JpL2Zwc0tleU1hbmFnZXIuZG8_c2l0ZUlkPUpLUEIiLCJjdXN0b21faGVhZGVyIjp7ImtleSI6InBhbGx5Y29uLWN1c3RvbWRhdGEtdjIiLCJ2YWx1ZSI6ImV5SmtjbTFmZEhsd1pTSTZJa1poYVhKUWJHRjVJaXdpYzJsMFpWOXBaQ0k2SWtwTFVFSWlMQ0oxYzJWeVgybGtJam9pWm1semFHbHVaeUlzSW1OcFpDSTZJakl3TWpFd05EQTNMV28xTkhkbE0yRTVJaXdpZEc5clpXNGlPaUptZDJaTlVqZ3dNVk5FYkRSSVpEQXdRMlJyU3pKQ0x6ZDNWWE41ZDNvNFEyNTFSVFpTVURjMWFXRjVXREV3VWpRM1ExQTFORTFvUTNjd1RuQlZjSFZ2V0hWWVdXNXNVa2RDYm5SeGFUQlNRa3A0WlZNMGRHUndVM0JYT0hSclowcDZhMDVEZFVNelRFVnNVR0kxYVd4VE1sbFJSRlp3UXpWblQzRkJVRXhaV1VwWGRGaEtjWFpKTmpOcFVtSmtPWGxXZGxWSWJIVkhlalJuVmpGME1YcGxjV2RLZDFwWWNGUXhlamx5ZVhOUmVXdElTRUZsYjJJeVpteEdRVUZXWmpkelpqVXdia0ZCY0RsaVEwcHBNRlZzVGpGMmFsSnhOMm9yYzAwclNrOUZObGcyU2pSUWFuQnNNVkV3ZUc0NVdtVldXRzFJT1hWM1JXc3ZhMjlDTTNGTU16QnhWRE5ZUVhkbVJUVlpRV2M0UVROeFNHdzJaakJuVFdoMFJIbG1WSE42VDBoblkzVXpXR1IxTjJ4MmJtZEhlRUl4ZEZwRWJXZGllVVpWTTNCWWR5SXNJblJwYldWemRHRnRjQ0k2SWpJd01qRXRNRFF0TURoVU1EQTZNRGM2TXpKYUlpd2lhR0Z6YUNJNkltUjZabmRDTjBsSlFuQkRNMVZHUVdJME4xY3phVUpHT0RNdlYyZFFSaTlMVjB0NFIxWXdSVm9yTURnOUluMD0ifX19fV19.2eui0L62_RIniNZhOj99Bt7-8-ryBTiYiVAZuH7ReIg&custom_key=c871e7dc15dae93d4d504dcbffe057d527cc8e38fae7f6c594c9e93f4dc338a3",
            "mckey": "vAI3u6fD"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        containerView!.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        self.contentTableView.register(ContentCell.self, forCellReuseIdentifier: "ContentCell")
        contentTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView!)
        view.addSubview(contentTableView)
        
        containerView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView?.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        containerView?.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: (9/16)).isActive = true
        containerView?.backgroundColor = .black
        containerView?.delegate = self
        containerView.debug = true
        
        contentTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        //        contentTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: (1-9/16)).isActive = true
        contentTableView.topAnchor.constraint(equalTo: containerView!.bottomAnchor).isActive = true
        contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentTableView.backgroundColor = UIColor(red: 43.0, green: 36.0, blue: 36, alpha: 1.0)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initStorage()
    }
    private func initStorage(){
        
        kollusStorage.applicationKey = "29f1a4958aa77264c6218e5b6e8fd39ffb93122c"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        kollusStorage.applicationExpireDate = dateFormatter.date(from: "2025/12/31")
        kollusStorage.applicationBundleID = "com.se.kollus"
        kollusStorage.serverPort = 8388
        
        do {
            try kollusStorage.start()
            kollusStorage.delegate = self
            containerView.storage = kollusStorage
        } catch  {
            print("kollus storage init fail")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        
        cell.setTitle(title: contentList[indexPath.row]["title"] as! String)
        cell.setProgress(progress: contentList[indexPath.row]["progress"] as! Float)
        cell.setDownloaded(downloaded: (contentList[indexPath.row]["downloaded"] as! Bool))
        cell.playClicked = {
            guard let row = tableView.indexPath(for: cell)?.row else {return}
            if self.containerView.isPreparedToPlay || self.containerView.isPlaying {
                self.containerView = nil
                self.containerView = KollusPlayerView()
                self.containerView?.storage = self.kollusStorage
                self.containerView?.delegate = self
                self.containerView.debug = true
            }
//            if self.contentList[row]["downloaded"] as! Bool {
//                self.containerView!.mediaContentKey = self.contentList[row]["mckey"] as? String
//            }
//            else {
//                self.containerView!.contentURL = self.contentList[row]["url"] as? String
//                print(self.containerView.contentURL ?? "Player URL NIL")
//
//            }
            self.containerView!.contentURL = self.contentList[row]["url"] as? String
            do {
                try self.containerView!.prepareToPlay(withMode: .PlayerTypeHLS)
            }catch {
                print(error.localizedDescription)
            }
        }
        cell.downloadClicked = {
            
            guard let row = tableView.indexPath(for: cell)?.row else {return}
            
            do{
                try self.kollusStorage.removeContent("vAI3u6fD");
                let temp = try self.kollusStorage.loadContentURL(self.contentList[row]["url"] as? String)
                print(temp)
                do {
                    try self.kollusStorage.downloadContent(temp)
                }catch
                {
                    print(error.localizedDescription)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    //KollusStorageDelegate
    func kollusStorage(_ kollusStorage: KollusStorage!, downloadContent content: KollusContent!, error: Error!) {
        if error != nil {
            print(error.debugDescription)
        }
        else {
        
            
            let indexPath: IndexPath = IndexPath(row: 0, section: 0)
            
            
            let cell = contentTableView.cellForRow(at: indexPath) as! ContentCell
            print(cell.titleView.text)
            let pg = Float(content.downloadProgress) / Float(100)
            self.contentList[0]["progress"] = pg
            cell.setProgress(progress: pg)
            if content.downloadProgress == 100{
                self.contentList[0]["downloaded"] = true
                cell.setDownloaded(downloaded: true)
            }
            else {
                self.contentList[0]["downloaded"] = false
                cell.setDownloaded(downloaded: false)
            }
        }
        print(content.downloadProgress)
        
    }
    
    func kollusStorage(_ kollusStorage: KollusStorage!, request: [AnyHashable : Any]!, json: [AnyHashable : Any]!, error: Error!) {
        
    }
    
    func kollusStorage(_ kollusStorage: KollusStorage!, cur: Int32, count: Int32, error: Error!) {
        
    }
    
    func kollusStorage(_ kollusStorage: KollusStorage!, lmsData: String!, resultJson: [AnyHashable : Any]!) {
        
    }
    
    func onSendCompleteStoredLms(_ successCount: Int32, failCount: Int32) {
        
    }
    
    
    //KollusPlayerView Delegate
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, prepareToPlayWithError error: Error!) {
        do {
            try kollusPlayerView.play()
        }
        catch {
            
        }
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, play userInteraction: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, pause userInteraction: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, buffering: Bool, prepared: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, stop userInteraction: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, position: TimeInterval, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, scroll distance: CGPoint, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, zoom recognizer: UIPinchGestureRecognizer!, error: NSErrorPointer) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, naturalSize: CGSize) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, playerContentMode: KollusPlayerContentMode, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, playerContentFrame contentFrame: CGRect, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, playbackRate: Float, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, repeat: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, enabledOutput: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, unknownError error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, framerate: Int32) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, lockedPlayer playerType: KollusPlayerType) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, charset: UnsafeMutablePointer<Int8>!, caption: UnsafeMutablePointer<Int8>!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, thumbnail isThumbnail: Bool, error: Error!) {
        
    }
    
    func kollusPlayerView(_ kollusPlayerView: KollusPlayerView!, mck: String!) {
        
    }
    
    func kollusPlayerView(_ view: KollusPlayerView!, height: Int32) {
        
    }
}

