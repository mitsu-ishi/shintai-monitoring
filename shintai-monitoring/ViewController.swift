//
//  ViewController.swift
//  shintai-monitoring
//
//  Created by mitsunori ishigaki on 2020/06/08.
//  Copyright © 2020 mitsu.ishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NextViewController: UITableView!
    
    
    var foldingFlg1 = false
    var foldingFlg2 = false
    var foldingFlg3 = false

    // 配列   
    var items1: NSMutableArray = ["小児", "高齢者", "肝機能障害", "腎機能障害"]
    var items2: NSMutableArray = ["薬剤性パーキンソニスムス", "アカシジア","ジストニア","ジスキネジア","悪性症候群","高プロラクチン血症","性機能障害","体重増加","糖尿病"]
    var items3: NSMutableArray = ["甲状腺機能低下症","肝機能障害","腎機能障害","体重増加","発疹","薬物血中濃度上昇"]
    var section1: Dictionary = [String:NSMutableArray]()
    var section2: Dictionary = [String:NSMutableArray]()
    var section3: Dictionary = [String:NSMutableArray]()
    var sections: Array = [Dictionary<String,NSMutableArray>]()
    
   // MARK: アクション
      @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
          // タップされたセクションを取得する。
          guard let section = gestureRecognizer.view?.tag as Int? else {
              return
          }
          
          // フラグを設定する。
          switch section {
          case 0:
              foldingFlg1 = foldingFlg1 ? false : true
          case 1:
              foldingFlg2 = foldingFlg2 ? false : true
          case 2:
              foldingFlg3 = foldingFlg3 ? false : true
          default:
              break
          }
          
          // タップされたセクションを再読込する。
          NextViewController.reloadSections(NSIndexSet(index: section) as IndexSet, with: .none)
      }
    
    // MARK: メソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // テーブルビューの背景色を設定する。
        let bgColor = UIColor.green.withAlphaComponent(0.1)
        self.NextViewController.backgroundColor = bgColor
        self.NextViewController.backgroundView?.backgroundColor = bgColor
        
        // セクションのタイトルとデータの配列を設定する。
        section1 = ["第１章　特殊な病態を持つ患者への薬物療法":items1]
        section2 = ["第２章　抗精神病薬":items2]
        section3 = ["第３章　情動安定薬":items3]
        
        // セクションを配列に設定する。
        sections.append(section1)
        sections.append(section2)
        sections.append(section3)
        
        // デリゲートを設定する。
        NextViewController.delegate = self
        NextViewController.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: テーブルビューのデリゲードメソッド
    // UIViewを返す。
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // セクションのヘッダとなるビューを作成する。
        let myView: UIView = UIView()
        let label:UILabel = UILabel()
        for (key) in sections[section].keys
        {
            label.text = key
        }
        label.sizeToFit()
        label.textColor = UIColor.black
        myView.addSubview(label)
        myView.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 1.1, alpha: 1.0)
        
        
        // セクションのビューに対応する番号を設定する。
        myView.tag = section
        // セクションのビューにタップジェスチャーを設定する。
    myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gestureRecognizer:))))
        
        return myView
    }
        
    
    // セクションの数を返す。
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    // セルの数を返す。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブルビューのセル数の設定する。
        switch section {
        case 0:
            return foldingFlg1 ? 0 : self.items1.count
        case 1:
            return foldingFlg2 ? 0 : self.items2.count
        case 2:
            return foldingFlg3 ? 0 : self.items3.count
        default:
            return 0
        }
    }
    
    // セルを返す。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルにテキストを出力する。
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for:indexPath as IndexPath)
        for (value) in sections[indexPath.section].values
        {
            cell.textLabel?.text = value[indexPath.row] as? String
        }
        
        return cell
    }
    
       func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "toNextView",sender: nil)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
              if (segue.identifier == "toTextView") {
       let detailVC: NextViewController = (segue.destination as? NextViewController)!
               detailVC.data = [
                   "firstDetail": "振戦，筋強剛，動作緩慢，流涎",
                   "secondDetail": "第１世代抗精神病薬，一部の第２世代抗精神病薬　高齢女性",
                   "thirdDetail": "原因薬物の開始，もしくは増量が契機となる",
                   "fourthDetail": "数日〜数週間以内",
                   "fifthDetail": "陰性症状や抑うつ症状と間違われやすい",
                   "sixthDetail": "第２世代抗精神病薬を使用する．第１世代抗精神病薬を使用する場合は少量投与にする．抗パーキンソン薬を併用する．",
                   "seventhDetail": "抗がん薬などによる広範な脳障害では，筋強剛と無動が出現し，"
               ]
              }

       }

    
    }


