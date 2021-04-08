//
//  ContentCell.swift
//  kollus
//
//  Created by HyeonD on 2021/04/06.
//


import UIKit


class ContentCell: UITableViewCell {
    
    
    let titleView: UILabel = UILabel()
    let downloadProgress: UIProgressView = UIProgressView()
    let playButton : UIButton = UIButton(type: .custom)
    let downloadButton: UIButton = UIButton(type: .custom)
    
    var playClicked: (() -> Void)? = nil
    var downloadClicked: (() -> Void)? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        downloadProgress.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleView)
        contentView.addSubview(downloadProgress)
        contentView.addSubview(playButton)
        contentView.addSubview(downloadButton)
        
        let layout : UILayoutGuide = contentView.safeAreaLayoutGuide
        titleView.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        titleView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: layout.widthAnchor, multiplier: 0.25).isActive = true
        titleView.text = "ABCDEF"
        
        downloadProgress.leadingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: 10.0).isActive = true
        downloadProgress.widthAnchor.constraint(equalTo: layout.widthAnchor, multiplier: 0.3).isActive = true
        downloadProgress.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        downloadProgress.progress = 0.5
        
        
        playButton.leadingAnchor.constraint(equalTo: downloadProgress.trailingAnchor, constant: 10.0).isActive = true
        playButton.widthAnchor.constraint(equalTo: layout.heightAnchor, multiplier: 0.8).isActive = true
        playButton.heightAnchor.constraint(equalTo: layout.heightAnchor, multiplier: 0.8).isActive = true
        playButton.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        self.layoutIfNeeded()
        playButton.layer.cornerRadius = 0.25 * playButton.frame.width
        playButton.clipsToBounds = true
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        
        
        downloadButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 10.0).isActive = true
        downloadButton.widthAnchor.constraint(equalTo: layout.heightAnchor, multiplier: 0.8).isActive = true
        downloadButton.heightAnchor.constraint(equalTo: layout.heightAnchor, multiplier: 0.8).isActive = true
        downloadButton.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        self.layoutIfNeeded()
        downloadButton.layer.cornerRadius = 0.25 * downloadButton.frame.width
        downloadButton.clipsToBounds = true
        downloadButton.setImage(UIImage(systemName: "icloud.and.arrow.down.fill"), for: .normal)
        
        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        downloadButton.addTarget(self, action: #selector(downloadButtonClicked), for: .touchUpInside)
    }
    
    required init(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    @objc
    func playButtonClicked(){
        self.playClicked!()
    }
    @objc
    func downloadButtonClicked(){
        self.downloadClicked!()
    }
    public func setTitle(title: String){
        titleView.text = title
    }
    public func setProgress(progress: Float){
        downloadProgress.progress = progress
        print("progress: " + String(progress))
    }
    public func setDownloaded(downloaded: Bool){
        downloadProgress.isHidden = downloaded
        downloadButton.isHidden = downloaded
    }
}
