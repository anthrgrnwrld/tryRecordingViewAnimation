//
//  ViewController.swift
//  TryRecordingViewAnimation
//
//  Created by anthrgrnwrld on 2018/01/15.
//  Copyright © 2018年 anthrgrnwrld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RecViewAnimationDelegate {

	@IBOutlet weak var recordingTargetView: UIView!	//録画対象のView
	@IBOutlet weak var movingBlock: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		//recordingTargetView内のmovingBlockが動くアニメーション
		UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.repeat, animations: {
			self.movingBlock.frame.origin.x += 100
		}, completion: nil)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func pressStartButton(_ sender: Any) {
		//録画開始
		//1. recorderをRecViewAnimationクラスで取得 (*因みにRecViewAnimationはシングルトン)
		let recorder = RecViewAnimation.shared
		
		//2. delegateを設定
		recorder.delegate = self
		
		//3. startRecordingメソッドで録画を開始する
		//その際引数として録画対象のviewと録画する際のフレームレートを指定してあげる
		//既に録画中などで録画が開始できない場合にはstartRecordingメソッドの返り値としてfalseが返ってくる
		let isSuccessToRec = recorder.startRecording(view: self.recordingTargetView, fpsSetting: 30)
		
		if isSuccessToRec {
			print("recording is started.")
		} else {
			print("recording is failed.")
		}
	}
	

	@IBAction func pressStopButton(_ sender: Any) {
		//録画停止
		//1. recorderをRecViewAnimationクラスで取得 (*因みにRecViewAnimationはシングルトン)
		let recorder = RecViewAnimation.shared

		//2. stopRecordingメソッドで録画を停止する
		//録画中を開始していない、または既に停止しているなどの場合にはstopRecordingメソッドの返り値としてfalseが返ってくる
		let isSuccessedToRec = recorder.stopRecording()
		
		print("return of stopRecording is \(isSuccessedToRec)")
		
	}
	
	func recViewDidFinishedToSaveDelegate() {
		//makeMovieDidFinishedToSaveDelegate
		//録画した動画ファイルのライブラリへの保存が完了した場合に呼ばれるDelegateメソッド
		//保存が完了したか否かの判断を本メソッドがコールされたかで判断できる
		
		print("\(NSStringFromClass(self.classForCoder)).\(#function) is called!")
	}
	
	func recViewDidFinishedWithoutCallToStop() {
		//recViewDidFinishedWithoutCallToStop
		//録画対象のViewの大きさが途中で変更された場合には、
		//現状stopRecordingをコールせずともRecViewAnimationクラス側で録画をストップする仕様としている
		//本メソッドは上記の様なケースで録画が停止された場合に呼ばれるメソッド
		
		print("\(NSStringFromClass(self.classForCoder)).\(#function) is called!")
	}
	
	
}

