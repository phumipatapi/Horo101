//
//  typemenu.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 13/11/2563 BE.
//

import UIKit
import Gemini
import CenteredCollectionView
class typemenu: UIViewController {

    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var collection: GeminiCollectionView!
    
    var gypsymenu = gypsy()
    var selector=""
    var CenteredCollectionViewFlowLayout : CenteredCollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        CenteredCollectionViewFlowLayout = collection.collectionViewLayout as? CenteredCollectionViewFlowLayout
        CenteredCollectionViewFlowLayout.minimumLineSpacing = 30
        CenteredCollectionViewFlowLayout.minimumInteritemSpacing = 40
        CenteredCollectionViewFlowLayout.sectionInset.top = 50
        CenteredCollectionViewFlowLayout.itemSize = CGSize(width: 322, height: 564)
      
        collection.gemini
            .scaleAnimation()
            .scale(0.75)
            .scaleEffect(.scaleUp)
        
        collection.decelerationRate = UIScrollView.DecelerationRate.fast
        collection?.dataSource = self
        collection?.delegate = self
        back.imageView?.contentMode = .scaleAspectFit
        back.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        back.imageView?.tintColor = UIColor.systemPink
        //directory()
        // Do any additional setup after loading the view.
    }

    }
extension typemenu : UICollectionViewDelegate,UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gypsymenu.type.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "gypsymenu", for: indexPath) as! gypsycell
        
        cell.gyplb.text = gypsymenu.type[indexPath.row]
        cell.image.image = gypsymenu.image[indexPath.row]
        
        self.collection.animateCell(cell)
        
        cell.contentView.layer.cornerRadius = 40
        cell.layer.shadowColor = UIColor.red.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cell.layer.shadowRadius = 25
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collection.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? menucell {
            self.collection.animateCell(cell)
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
            guard let gypsy = segue.destination as? gypsytype else { return }

            gypsy.typeselec = gypsymenu.type[indexPath.row]
         

        default: return
        }
}

}
