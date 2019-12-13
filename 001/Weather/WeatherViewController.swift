//
//  WeatherViewController.swift
//  001
//
//  Created by Kede on 2019/12/13.
//  Copyright © 2019 Clare. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    let hfKey = "f817284285734e6c8f3c85ac68b2c72b"
    let cellIdentifier = "weather"
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = NSLocalizedString("Weather", comment: "Weather")
        
        requestWeatherData()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let size = UIScreen.main.bounds.size
        flowLayout.estimatedItemSize = CGSize(width: size.width, height: size.height - 88 - 34)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    fileprivate enum WeatherType: String {
        case now, forecast, hourly, lifestyle
    }
    
    func requestWeatherData() {
        let city = "shanghai"
        let url = "https://free-api.heweather.net/s6/weather/\(WeatherType.now)?location=\(city)&key=\(hfKey)"
        
        AF.request(url).responseJSON {response in
            print(response)
        }
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

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: - UICollectionViewDelegate UICollectionViewDatasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WeatherCollectionViewCell
        return cell
    }
    
    
    
    
}
