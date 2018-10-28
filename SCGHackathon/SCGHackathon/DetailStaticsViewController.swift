//
//  DetailStaticsViewController.swift
//  SCGHackathon
//
//  Created by Hoang Hiep Ho on 10/27/18.
//  Copyright © 2018 Gamedex. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

class DetailStaticsViewController: UIViewController, TwicketSegmentedControlDelegate {

    @IBOutlet var name: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var naviView: UIView!
    @IBOutlet var segmentBigView: UIView!
    @IBOutlet var segmentControlView: UIView!
    @IBOutlet var segmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSegmenControlView()
        self.name.text = "SK Factory"
        self.country.text = "China"
    }

    
    private lazy var lineChartViewController: LineChartViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var vc = storyboard.instantiateViewController(withIdentifier: "LineChartViewController") as! LineChartViewController
        
        self.add(asChildViewController: vc, segmentControlView: segmentControlView)
        
        return vc
    }()
    
    private lazy var tableStaticsViewController: TableStaticsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var vc = storyboard.instantiateViewController(withIdentifier: "TableStaticsViewController") as! TableStaticsViewController
        
        self.add(asChildViewController: vc, segmentControlView: segmentControlView)
        
        return vc
    }()
    
    func setupSegmenControlView(){
        
        segmentBigView.dropShadow()
        segmentBigView.layer.cornerRadius = 10
        segmentBigView.layer.masksToBounds = true
        //naviView.dropShadow()
        
        // setup Segmen Control
        let frame = CGRect(x: 10, y: 10, width: view.frame.width - 10, height: 40)
        let segmentControl = TwicketSegmentedControl(frame: frame)
        
        let titles = ["Statics", "Table Data"]
        segmentControl.setSegmentItems(titles)
        segmentControl.delegate = self
        segmentControl.isSliderShadowHidden = false
        segmentControl.segmentsBackgroundColor = .white
        segmentControl.sliderBackgroundColor = .blue
        segmentControl.highlightTextColor = .white
        segmentControl.defaultTextColor = .blue
        segmentControl.backgroundColor = .clear
        
        segmentControlView.addSubview(segmentControl)
        
        // move segment control default to index at 0
        segmentControl.move(to: 0)
        segmentControl.delegate?.didSelect(0)
    }
    
    
    
    func didSelect(_ segmentIndex: Int) {
        print("index \(segmentIndex)")
        switch segmentIndex
        {
        case 0:
            add(asChildViewController: lineChartViewController, segmentControlView: segmentView)
            remove(asChildViewController: tableStaticsViewController)
            
        case 1:
            add(asChildViewController: tableStaticsViewController, segmentControlView: segmentView)
            remove(asChildViewController: lineChartViewController)

        default:
            break;
        }
        
    }

    @IBAction func invokeBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
