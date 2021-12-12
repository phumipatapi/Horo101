//
//  gypsytype.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 24/11/2563 BE.
//

import UIKit
import CenteredCollectionView
import Gemini
class gypsytype: UIViewController {
   
    @IBOutlet weak var colllectionviewcard: GeminiCollectionView!
    
    var CenteredCollectionViewFlowLayout : CenteredCollectionViewFlowLayout!
    var typeselec=""
    var gypsy = gypsymenu()
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var typeshowlb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        CenteredCollectionViewFlowLayout = colllectionviewcard.collectionViewLayout as? CenteredCollectionViewFlowLayout
        CenteredCollectionViewFlowLayout.minimumLineSpacing = 30
        CenteredCollectionViewFlowLayout.minimumInteritemSpacing = 40
        CenteredCollectionViewFlowLayout.sectionInset.top = 50
        CenteredCollectionViewFlowLayout.itemSize = CGSize(width: 322, height: 564)
        
        colllectionviewcard.gemini
            .scaleAnimation()
            .scale(0.75)
            .scaleEffect(.scaleUp)
      
        

        
        colllectionviewcard.decelerationRate = UIScrollView.DecelerationRate.fast
        typeshowlb.text = typeselec
        colllectionviewcard?.dataSource = self
        colllectionviewcard?.delegate = self
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        backbtn.imageView?.contentMode = .scaleAspectFit
    }}
    
extension gypsytype : UICollectionViewDataSource,UICollectionViewDelegate {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch typeselec {
            case "ทั่วไป":
                return gypsy.normal.count
            case "ความรัก" :
                return gypsy.love.count
            case "การงาน":
                return gypsy.work.count
            default:
                return 1
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell=colllectionviewcard.dequeueReusableCell(withReuseIdentifier: "gypsymenu", for: indexPath) as! gypsytypecell
            cell.contentView.layer.cornerRadius = 40
            cell.layer.shadowColor = UIColor.red.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0.3)
            cell.layer.shadowRadius = 25
            cell.layer.shadowOpacity = 0.25
            cell.layer.masksToBounds = false
            cell.cardtypelb.adjustsFontSizeToFitWidth = true
            switch typeselec {
            case "ทั่วไป":
                cell.cardtypelb.text = gypsy.normal[indexPath.row]
                cell.cardtype.image = gypsy.normalpic[indexPath.row]
                self.colllectionviewcard.animateCell(cell)
                return cell
            case "ความรัก" :
                cell.cardtypelb.text = gypsy.love[indexPath.row]
                cell.cardtype.image = gypsy.lovepic[indexPath.row]
                self.colllectionviewcard.animateCell(cell)
                return cell
            case "การงาน" :
                cell.cardtypelb.text = gypsy.work[indexPath.row]
                cell.cardtype.image = gypsy.workpic[indexPath.row]
                self.colllectionviewcard.animateCell(cell)
                return cell
            default:
                return cell
            }
        }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.colllectionviewcard.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? menucell {
            self.colllectionviewcard.animateCell(cell)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
        switch segue.identifier {
        case "menu":
            if typeselec == "ทั่วไป" {
                
                if indexPath == [0,0] {
                let norm = storyboard?.instantiateViewController(identifier: "onenorm") as! onecardnormNav
                self.view.window?.rootViewController = norm
            }
                else if indexPath == [0,1] {
                    let pastpre = storyboard?.instantiateViewController(identifier: "pastpre") as! pastpreNav
                    self.view.window?.rootViewController = pastpre
                }
                else if indexPath == [0,2] {
                    let celtic = storyboard?.instantiateViewController(identifier: "celtic") as! CelticNav
                    self.view.window?.rootViewController = celtic
                }
            }
            else if typeselec == "ความรัก" {
                
                if indexPath == [0,0] {
                let loverela = storyboard?.instantiateViewController(identifier: "relation") as! loverelasionNav
                self.view.window?.rootViewController = loverela
            }
                else if indexPath == [0,1] {
                    let closeyou = storyboard?.instantiateViewController(identifier: "closeyou") as! closeofyouNav
                    self.view.window?.rootViewController = closeyou
                }
                else if indexPath == [0,2] {
                    let readylove = storyboard?.instantiateViewController(identifier: "readylove") as! readytoloveNav
                    self.view.window?.rootViewController = readylove
                }
                
            }
            else if typeselec == "การงาน" {
                if indexPath == [0,0] {
                let problem = storyboard?.instantiateViewController(identifier: "problem") as! problemNAV
                self.view.window?.rootViewController = problem
            }
                else if indexPath == [0,1] {
                    let present = storyboard?.instantiateViewController(identifier: "present") as! presentworkNAV
                    self.view.window?.rootViewController = present
                }
                else if indexPath == [0,2] {
                    let money = storyboard?.instantiateViewController(identifier: "money") as! moneyNAV
                    self.view.window?.rootViewController = money
                }
                
            
            }
        default: return
        }
}
}
