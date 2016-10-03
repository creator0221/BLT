import Foundation
import UIKit

class ScheduleController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var segmentFilter = UISegmentedControl()
    
    var viewForTouchWrite: UIView!
    var buttonForUserPortrait: UIButton!
    var textFieldForTouchWriting: UITextField!
    var buttonForWritingMore: UIButton!
    
    var tableForNoteList: UITableView!
    
    var calculate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        self.title = "时程"
        self.tabBarItem = UITabBarItem(title: "时程", image: UIImage(named: "schedul"), selectedImage: UIImage(named: "schedul"))
        
        // Create all of views.
        createBlockForFilter()
        createBlockForTouchWrite()
        createBlockForNoteList()
    }
    
    func createBlockForFilter() {
        self.view.addSubview(segmentFilter)
        self.segmentFilter.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 29)
        self.segmentFilter.insertSegment(withTitle: "全部", at: 1, animated: true)
        self.segmentFilter.insertSegment(withTitle: "备忘", at: 2, animated: true)
        self.segmentFilter.insertSegment(withTitle: "日程", at: 3, animated: true)
        self.segmentFilter.backgroundColor = UIColor.clear
        self.segmentFilter.selectedSegmentIndex = 1
    }
    
    func createBlockForTouchWrite() {
        self.viewForTouchWrite = UIView(frame: CGRect(x: 0, y: 103, width: self.view.bounds.width, height: 60))
        self.viewForTouchWrite.backgroundColor = UIColor.white
        self.view.addSubview(viewForTouchWrite)
        
        self.buttonForUserPortrait = UIButton(type: UIButtonType.custom)
        self.buttonForUserPortrait.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        self.buttonForUserPortrait.setImage(UIImage(named: "thumb_DSCF7965_1024.jpg"), for: .normal)
        self.buttonForUserPortrait.backgroundColor = UIColor.clear
        self.buttonForUserPortrait.addTarget(self, action: #selector(previewUserPortrait(sender:)), for: .touchUpInside)
        self.viewForTouchWrite.addSubview(buttonForUserPortrait)
        
        self.textFieldForTouchWriting = UITextField(frame: CGRect(x: 60, y: 10, width: viewForTouchWrite.frame.width - 10, height: 40))
        self.textFieldForTouchWriting.backgroundColor = UIColor.clear
        self.textFieldForTouchWriting.placeholder = "Writing something..."
        self.textFieldForTouchWriting.textColor = UIColor.black
        self.textFieldForTouchWriting.clearButtonMode = UITextFieldViewMode.whileEditing
        self.textFieldForTouchWriting.returnKeyType = UIReturnKeyType.done
        self.textFieldForTouchWriting.delegate = self
        self.viewForTouchWrite.addSubview(textFieldForTouchWriting)
        
        buttonForWritingMore = UIButton(type: UIButtonType.custom)
        self.buttonForWritingMore.frame = CGRect(x: viewForTouchWrite.frame.width - 60, y: 10, width: 50, height: 40)
        self.buttonForWritingMore.setTitle("More", for: .normal)
        self.buttonForWritingMore.backgroundColor = UIColor.clear
        self.buttonForWritingMore.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.buttonForWritingMore.setTitleColor(UIColor.blue, for: .normal)
        self.buttonForWritingMore.addTarget(self, action: #selector(pushWriting(sender:)), for: .touchUpInside)
        self.buttonForWritingMore.isHidden = true
        self.viewForTouchWrite.addSubview(buttonForWritingMore)
    }
    
    func createBlockForNoteList() {
        self.tableForNoteList = UITableView(frame: CGRect(x: 0, y: 173, width: self.view.frame.width, height: self.view.frame.height-173-44), style: .grouped)
        self.tableForNoteList.delegate = self
        self.tableForNoteList.dataSource = self
        self.tableForNoteList.register(UITableViewCell.self, forCellReuseIdentifier: "noteCell")
        self.view.addSubview(self.tableForNoteList)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "09/22/16"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(0.0000001)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        noteCell.textLabel?.text = "有一件事情要找你协商..."
        noteCell.imageView?.image = UIImage(named: "schedul")
        noteCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        noteCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return noteCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.textFieldForTouchWriting.resignFirstResponder()
        self.buttonForWritingMore.isHidden = true
        self.textFieldForTouchWriting.frame = CGRect(x: 60, y: 10, width: viewForTouchWrite.frame.width - 10, height: 40)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        
        self.show(ScheduleDetailController(), sender: self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.buttonForWritingMore.isHidden = false
        self.textFieldForTouchWriting.frame = CGRect(x: 60, y: 10, width: viewForTouchWrite.frame.width - 130, height: 40)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.textFieldForTouchWriting.resignFirstResponder()
        self.buttonForWritingMore.isHidden = true
        self.textFieldForTouchWriting.frame = CGRect(x: 60, y: 10, width: viewForTouchWrite.frame.width - 10, height: 40)
    }
    
    func pushWriting(sender: AnyObject) {
        let navi = UINavigationController(rootViewController: WritingController())
        
        self.present(navi, animated: true, completion: nil)
    }
    
    func previewUserPortrait(sender: AnyObject) {
        self.present(UserPortraitController(), animated: false, completion: nil)
    }
    
    func textFieldWillBeChange(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
