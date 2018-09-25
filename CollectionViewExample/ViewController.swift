//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let items: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var listDepartment: [Department] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        initData()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        listDepartment = [Department(false, "Fresher - 1", [Person("","Nguyễn Đình Tú",22), Person("","Dương Thu Hiền", 22)]),
                          Department(true, "Fresher - 2", [Person("","Đặng Xuân Duy",22), Person("","Đinh Ngọc Vũ", 23)]),
                          Department(true, "Fresher - 3", [Person("","Ngô Văn Thịnh",25), Person("","Nguyễn Đức Việt", 23)]),
                          Department(true, "Fresher - 4", [Person("","Nguyễn Tùng Lâm",22), Person("","Văn Tiến Thành", 22)])]
    }
    func registerCollectionView() {
          collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect: CGRect = UIScreen.main.bounds
        let screenWidth: CGFloat = screenRect.size.width
        let cellWidth = Float(screenWidth / 3) - 1 //Replace the divisor with the column count requirement. Make sure to have it in float.
        let size = CGSize(width: CGFloat(cellWidth), height: CGFloat(cellWidth))

        return size
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.numberLabel.text = "\(items[indexPath.row])"
        return cell
    }
    
    
}

