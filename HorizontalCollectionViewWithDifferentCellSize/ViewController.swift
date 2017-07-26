//
//  ViewController.swift
//  HorizontalCollectionViewWithDifferentCellSize
//
//  Created by 丁偉哲 on 2017/7/26.
//  Copyright © 2017年 丁偉哲. All rights reserved.
//

import UIKit
extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CVCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    //點擊到的cell移動到中間
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        centerIndexPath = indexPath
        collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    //設置集合視圖單元格大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if let centerIndexPath = centerIndexPath {
            if indexPath == centerIndexPath {//
                return CGSize(width: collectionView.bounds.height , height: collectionView.bounds.height )
            }
        }
        return CGSize(width: collectionView.bounds.height * 0.8 , height: collectionView.bounds.height * 0.8)
    }
    
    // 設置cell和視圖邊的間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // 設置每一個cell最小 行 間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    // 設置每一個cell的 列 間距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    // 設置Header的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: 0, height: 0)
    }
    
    // 設置Footer的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        return CGSize(width: 0, height: 0)
    }
}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            centerIndexPath = collectionView.indexPathForItem(at: view.convert(view.center, to: collectionView))//滑動時取得正中間的indexPath
            collectionView.reloadData()
        }
    }
    
}
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var screenHeight :CGFloat { return  UIScreen.main.bounds.height }
    var screenWidth:CGFloat { return  UIScreen.main.bounds.width }
    var centerIndexPath: IndexPath!//用來儲存當前的indexPath
    
    fileprivate var images = ["1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

