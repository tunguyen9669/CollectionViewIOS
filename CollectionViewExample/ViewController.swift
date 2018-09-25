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
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect: CGRect = UIScreen.main.bounds
        let screenWidth: CGFloat = screenRect.size.width
        let cellWidth = Float(screenWidth / 2) - 1 //Replace the divisor with the column count requirement. Make sure to have it in float.
        if listDepartment[indexPath.section].isExpand == true {
            let size = CGSize(width: CGFloat(cellWidth), height: CGFloat(cellWidth))
            return size
        } else {
            return CGSize(width: screenWidth, height: 0.0)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDepartment[section].person.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listDepartment.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.numberLabel.text = "\(listDepartment[indexPath.section].person[indexPath.row].name)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeaderView: HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView else {
            return UICollectionViewCell()
        }
        
            sectionHeaderView.departmentLabel.text = listDepartment[indexPath.section].title
            sectionHeaderView.section = indexPath.section
            sectionHeaderView.delegate = self
            return sectionHeaderView
    }
}
extension ViewController: HeaderViewDelegate {
    
    func toggleSection(header: HeaderView, section: Int) {
        let expand = !listDepartment[section].isExpand
        
        print("toggleSection \(section)")
        
        // Toggle expand
        listDepartment[section].isExpand = expand
        
        // Reload the whole section
        
        collectionView.reloadData()
    }
}

