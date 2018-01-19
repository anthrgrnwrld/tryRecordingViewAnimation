# About RecViewAnimation

This is a class of swift for recording view and outputing movie file to library.
It is Singleton class.

# How to install RecViewAnimation

Please drop the file of "RecordingViewAnimation.swift" to your Project Navigator.

# How to use RecViewAnimation

1. Start recording

```swift
//1. Make instance of RecViewAnimation
let recorder = RecViewAnimation.shared

//2. Set delegate
recorder.delegate = self

//3. Call startRecording method
//   This class can not recording 2 or more target.
//   If it has already started to record, startRecording will return false.
//   parameter view: Enter the view that you would like to recodrd.
//   parameter fpsSetting: Enter the frame rate setting. (If you set 30, frame number is 30 per 1 second.)
let isSuccessToRec = recorder.startRecording(view: self.recordingTargetView, fpsSetting: 30)
```

2. Stop recording

```swift
//1. Make instance of RecViewAnimation (RecViewAnimation is Singleton class.)
let recorder = RecViewAnimation.shared

//2. Call stopRecording method
//   If it does not start recording or has already stopped to record, stopRecording will return false.
let isSuccessedToRec = recorder.stopRecording()
```

3. Delegate method

First, please add the description of "RecViewAnimationDelegate" to YOUR VIEWCONTROLLER.

 - recViewDidFinishedToSaveDelegate(): 
  When RecViewAnimation instance finished to save the movie file to Photo library of iOS device, this delegate method is called.
 
 - recViewDidFinishedWithoutCallToStop(): 
  RecViewAnimation does not permit to change view size during recording.
  If it happens view size is changed, it will stop to record.
  When it happens above, this delegate method is called.
