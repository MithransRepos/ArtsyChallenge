//
//  TestTextureController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//
/*
 import AsyncDisplayKit
 import Foundation
 import XLPagerTabStrip

 final class TextureViewController: ASViewController<ASDisplayNode>, ASCollectionDataSource, ASCollectionDelegate {
 let flowLayout: UICollectionViewFlowLayout
 let collectionNode: ASCollectionNode
 var tittleText: String = ""

 init(tittleText: String) {
     self.tittleText = tittleText
     flowLayout = UICollectionViewFlowLayout()
     collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)

     super.init(node: collectionNode)

     collectionNode.delegate = self
     collectionNode.dataSource = self
 }

 @available(*, unavailable)
 required init?(coder _: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }

 override func viewDidLoad() {
     super.viewDidLoad()
     let size = floor((collectionNode.frame.width - 50) / 2)
     flowLayout.itemSize = CGSize(width: size, height: 150)
     flowLayout.minimumInteritemSpacing = 10
     flowLayout.minimumLineSpacing = 10
 }

 func numberOfSections(in _: ASCollectionNode) -> Int {
     return 1
 }

 func collectionNode(_: ASCollectionNode, numberOfItemsInSection _: Int) -> Int {
     return 200
 }

 func collectionNode(_: ASCollectionNode, nodeBlockForItemAt _: IndexPath) -> ASCellNodeBlock {
     return { () -> ASCellNode in
         let cellNode = TextureCollectionViewCell()
         cellNode.imageView.image = Icon.home.getImage
         return cellNode
     }
 }
 }

 final class TextureCollectionViewCell: ASCellNode {
 let imageView = ASImageNode()

 override init() {
     super.init()
     imageView.contentMode = .scaleAspectFill
     imageView.backgroundColor = UIColor.lightGray
     addSubnode(imageView)
 }

 override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
     return ASWrapperLayoutSpec(layoutElement: imageView)
 }
 }

 extension TextureViewController: IndicatorInfoProvider {
 func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
     let indicatorItem = IndicatorInfo(title: tittleText)
     return indicatorItem
 }
 }
 */
