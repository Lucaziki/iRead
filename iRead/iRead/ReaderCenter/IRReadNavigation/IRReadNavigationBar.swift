//
//  IRReadNavigationBar.swift
//  iRead
//
//  Created by zzyong on 2020/10/13.
//  Copyright © 2020 zzyong. All rights reserved.
//

import UIKit
import SnapKit

protocol IRReadNavigationBarDelegate: NSObjectProtocol {
    
    func readNavigationBar(didClickBack bar: IRReadNavigationBar)
    func readNavigationBar(didClickChapterList bar: IRReadNavigationBar)
}

class IRReadNavigationBar: UIView {

    let itemHeight: CGFloat = 44.0
    var backButton: UIButton!
    var chapterList: UIButton!
    var delegate: IRReadNavigationBarDelegate?
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupSubviews()
    }
    
    //MARK: - Private
    
    func setupSubviews() {
        
        backButton = UIButton.init(type: .custom)
        backButton.setImage(UIImage.init(named: "arrow_back"), for: .normal)
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
        self.addSubview(backButton)
        backButton.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(itemHeight)
            make.bottom.equalTo(self)
            make.left.equalTo(self).offset(10)
         }
        
        chapterList = UIButton.init(type: .custom)
        chapterList.setImage(UIImage.init(named: "bar_chapter_list"), for: .normal)
        chapterList.addTarget(self, action: #selector(didClickChapterListButton), for: .touchUpInside)
        self.addSubview(chapterList)
        chapterList.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(itemHeight)
            make.bottom.equalTo(self)
            make.left.equalTo(backButton.snp.right)
         }
    }
    
    //MARK: - Action
    
    @objc func didClickBackButton() {
        self.delegate?.readNavigationBar(didClickBack: self)
    }
    
    @objc func didClickChapterListButton() {
        self.delegate?.readNavigationBar(didClickChapterList: self)
    }
}
