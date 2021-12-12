//
//  menucontroller.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 11/11/2563 BE.
//

import UIKit
import OHMySQL
import CenteredCollectionView
import Gemini
class MenuController: UIViewController {

    @IBOutlet weak var collectionView: GeminiCollectionView!
   
    var manustr = menu()
    var CenteredCollectionViewFlowLayout : CenteredCollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.gemini
            .scaleAnimation()
            .scale(0.75)
            .scaleEffect(.scaleUp)
////
//        collectionView.gemini
//            .cubeAnimation()
//            .cubeDegree(90)
//
        
        
        CenteredCollectionViewFlowLayout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
       
        CenteredCollectionViewFlowLayout.minimumInteritemSpacing = 20
        CenteredCollectionViewFlowLayout.sectionInset.top = 50
        CenteredCollectionViewFlowLayout.itemSize = CGSize(width: 322, height: 564)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.navigationController?.isNavigationBarHidden = true
        collectionView?.dataSource = self
        collectionView?.delegate = self
        connectdb()
        
    }
    func connectdb() {
    guard let wifiIp = getAddress(for: .wifi) else { return }
        //print(wifiIp)
    //simulator
//
//    let user = OHMySQLUser(userName: "root", password: password, serverName: "servername", dbName: "dbname", port: 3306, socket: "socket")
  
  
       
    let coordinator = OHMySQLStoreCoordinator(user: user!)
        coordinator.encoding = .UTF8MB4
        
        coordinator.connect()
        
        let context = OHMySQLQueryContext()
        context.storeCoordinator = coordinator
        OHMySQLContainer.shared.mainQueryContext = context
        }
        }
        
    



extension MenuController : UICollectionViewDataSource,UICollectionViewDelegate
{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manustr.type.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! menucell
        cell.menulb.text = manustr.type[indexPath.row]
        cell.imagemenu.image = manustr.imgtype[indexPath.row]
        cell.contentView.layer.cornerRadius = 40
        cell.layer.shadowColor = UIColor.red.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cell.layer.shadowRadius = 25
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false
        
        self.collectionView.animateCell(cell)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? menucell {
            self.collectionView.animateCell(cell)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
            if indexPath == [0, 0] {
                let CardofDay = storyboard?.instantiateViewController(identifier: "cardday") as! Navcon
                self.view.window?.rootViewController = CardofDay
            }
            else if indexPath == [0, 2] {
                let Xiamsi = storyboard?.instantiateViewController(identifier: "xiamsi") as! xiamsinav
                self.view.window?.rootViewController = Xiamsi
            }
            else if indexPath == [0,3] {
                let fortune = storyboard?.instantiateViewController(identifier: "fortune") as! fortuneNAV
                self.view.window?.rootViewController = fortune
            }
        default: return
        }
    }
    enum Network: String {
        case wifi = "en0"
        case cellular = "pdp_ip0"
    }
    func getAddress(for network: Network) -> String? {
        var address: String?

        // Get list of all interfaces on the local machine:
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if name == network.rawValue {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
   

}

extension UIView {
    func findCollectionView() -> UICollectionView? {
        if let collectionView = self as? UICollectionView {
            return collectionView
        } else {
            return superview?.findCollectionView()
        }
    }

    func findCollectionViewCell() -> UICollectionViewCell? {
        if let cell = self as? UICollectionViewCell {
            return cell
        } else {
            return superview?.findCollectionViewCell()
        }
    }

    func findCollectionViewIndexPath() -> IndexPath? {
        guard let cell = findCollectionViewCell(), let collectionView = cell.findCollectionView() else { return nil }
        return collectionView.indexPath(for: cell)
    }
}
    

    



