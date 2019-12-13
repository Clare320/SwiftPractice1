//
//  NetworkViewController.swift
//  001
//
//  Created by Kede on 2019/12/13.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = NSLocalizedString("Network", comment: "Network")
    }
    

    private struct HTTPBinResponse: Decodable {
        let url: String
    }
    
    private func testResponseHandler(_ type: Int = 0) {
        let url = "https://httpbin.org/get"
        let dataRequest = AF.request(url)
        
        switch type {
        case 0:
            dataRequest.response { response in
                debugPrint("Response: \(response)")
            }
        case 1:
            dataRequest.responseData { (response) in
                debugPrint("Response: \(response)")
            }
        case 2:
            dataRequest.responseString { (response) in
                debugPrint("Response: \(response)")
            }
        case 3:
            dataRequest.responseJSON { (response) in
                debugPrint("Response: \(response)")
            }
        case 4:
            dataRequest.responseDecodable(of: HTTPBinResponse.self) { (response) in
                debugPrint("Response: \(response)")
            }
        default:
            print("invaild type!!!")
        }
    }
    
    @IBAction func changeResponseType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        testResponseHandler(index)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
