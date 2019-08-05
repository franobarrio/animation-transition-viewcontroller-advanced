/*
 * Copyright (c) Francisco Obarrio - fobarrio@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

// MARK: - DataSource
extension MainViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
        cell.setupCell(backgroundImage:  dictionaryDataArray[indexPath.section]["backgroundImage"]!,
                       profileImage: dictionaryDataArray[indexPath.section]["profileImage"]!, backgroundColor: dictionaryDataArray[indexPath.section]["hexBackgroundColor"]!, title: dictionaryDataArray[indexPath.section]["title"]!, album: dictionaryDataArray[indexPath.section]["album"]!, year: dictionaryDataArray[indexPath.section]["year"]!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
        
        doAnimFadeOut()
        
        let finalVC = PushedViewController()
        finalVC.selectedProfileImage = dictionaryDataArray[indexPath.section]["profileImage"]!
        finalVC.selectedBackgroundImage = dictionaryDataArray[indexPath.section]["backgroundImage"]!
        finalVC.mainTitle = dictionaryDataArray[indexPath.section]["title"]!
        finalVC.album = dictionaryDataArray[indexPath.section]["album"]!
        finalVC.year = dictionaryDataArray[indexPath.section]["year"]!
        finalVC.topHexColor = dictionaryDataArray[indexPath.section]["hexBackgroundColor"]!
        
        
        navigationController?.delegate = transition
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(self.tableView.visibleCells.count) * 0.15 )) { // change 2 to desired number of seconds
            self.navigationController?.pushViewController(finalVC, animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionaryDataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    //Let's insert a headerView to create the spacing we want
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20) //size of a standard tableViewCell
        view.backgroundColor = UIColor.clear
        return view
    }
    
}
