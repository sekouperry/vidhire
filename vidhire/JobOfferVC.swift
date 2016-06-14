//
//  JobOfferVC.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/6/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import UIKit

class JobOfferVC: UIViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
var job: jobs!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let tableheaderview: CGFloat = 350.0
    private var headerview: Jobinterview!
    private var headerMasklayer: CAShapeLayer!
    private let tableHeaderCutAway: CGFloat = 50.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       name.text = job.name
        headerview = tableView.tableHeaderView as! Jobinterview
        tableView.tableHeaderView = nil
        tableView.addSubview(headerview)
        
        tableView.contentInset = UIEdgeInsets(top: tableheaderview, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableheaderview)
        
        headerMasklayer = CAShapeLayer()
        headerMasklayer.fillColor = UIColor.blackColor().CGColor
        headerview.layer.mask = headerMasklayer
        
        updateHeaderView()
        

        
    }
    
    override func  viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderView()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderView()
    }
    
    func updateHeaderView() {
        let effectiveHeight = tableheaderview - tableHeaderCutAway / 2
        var headerRect  = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: tableHeaderCutAway)
        if tableView.contentOffset.y <  -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + tableHeaderCutAway/2
            
            
        }
        
        headerview.frame = headerRect
        
        //cut away
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height - tableHeaderCutAway))
        headerMasklayer?.path = path.CGPath
        
        
        
        
    }
}


extension JobOfferVC : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the secion
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Post Cell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
}


extension JobOfferVC : UIScrollViewDelegate
{
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }


}

