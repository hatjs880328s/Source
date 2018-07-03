//
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * ** * * * *
//
// TwoViewController.swift
//
// Created by    Noah Shan on 2018/3/13
// InspurEmail   shanwzh@inspur.com
// GithubAddress https://github.com/hatjs880328s
//
// Copyright © 2018年 Inspur. All rights reserved.
//
// For the full copyright and license information, plz view the LICENSE(open source)
// File that was distributed with this source code.
//
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * ** * * * *
//
//


import UIKit

class TwoViewController: UIViewController {
    var timer : Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let bllone = BeanFactory().create(with: "oneBll") as! IBLLOne
        bllone.getName()
        bllone.setName()
        
    }
    
    @objc func go() {
        print("dd")
    }
    
    func getname(a: Int, b: Int)->Int {
        return a + b
    }
    
    @discardableResult
    func getNameNow(_ a: Int)->
        ((_ b: Int)-> Int)
    {
        var k = 0
        //progress a
        k += a
        return { b -> Int in
            //progress b
            k += b
            return k
        }
    }
    
    func sum(a: Int, b: Int) -> Int {
        return (a + 4) + (b + 5)
    }
    
    func sumCurrying(_ a: Int) ->((_ b: Int) -> Int) {
        var sum = 0
        //progress a
        sum += a + 4
        return { b -> Int in
            //progress b
            sum += b + 5
            return sum
        }
    }
    
    func sum1(a: Int,b: Int,c: Int) ->Int {
        return a + b + c
    }
    
    func sum1Currying(_ a: Int) -> ((_ b:Int)->(_ c: Int)->Int) {
        //progress a
        return { (b) -> ((_ c: Int) -> Int) in
            //progress b
            return { (c)-> Int in
                //progress c
                return a + b + c
            }
        }
    }
    
    func getName(id: Int, name: String ...) {
        for eachItem in name {
            print(eachItem)
        }
    }
    
    func getName1(id: Int ... , name: String) {
        for eachItem in id {
            print(eachItem)
        }
    }
    
    var queue: DispatchQueue!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if timer == nil {
            return
        }
        timer.fireDate = Date.distantPast
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(BASEViewController(), animated: true)
        timer.fireDate = Date.distantFuture
    }
    
    func getPath()->String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)[0]
        return ((path as NSString) as NSString).appendingPathComponent("mmaptest.txt")
    }
    
    func createFile() {
        DispatchQueue.once {
            let fileManager = FileManager.default
            let textPath = self.getPath()
            let result = fileManager.createFile(atPath: textPath, contents: nil, attributes: nil)
            if !result {
                DEBUGPrintLog("失败了！创建文件")
            }
        }
        
        
    }

    func writeData(info:NSString) {
        let path = self.getPath()
        let content: NSString = info
        do{
            try content.write(toFile: path, atomically: true, encoding: String.Encoding.utf8.rawValue)
        }catch {
            
        }
        
    }
    
    func readData() {
        let path = self.getPath()
        let content = NSData(contentsOfFile: path)
        let resultStr = NSString(data: content! as Data, encoding: String.Encoding.utf8.rawValue)
        DEBUGPrintLog(resultStr! as String)
    }
    
    func readMMap() {
        let path = self.getPath()
        do {
            var content = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.alwaysMapped)
            let oldContent = NSString(data: content as Data, encoding: String.Encoding.utf8.rawValue)
//            let newContent = oldContent?.appending("????1")
            DEBUGPrintLog(oldContent! as String)
//            self.writeData(info: newContent! as NSString)
        }catch {
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
