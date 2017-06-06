//
//  ViewController.m
//  Recording Audio
//
//  Created by Juda Cossa on 06/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate, AVAudioRecorderDelegate>

@end

@implementation ViewController
{
    AVAudioPlayer * player;
    AVAudioRecorder * recorder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)startRecordingAudio{
    NSError * error;
    NSURL * recordingPath = [self audioRecordingPath];
    recorder = [[AVAudioRecorder alloc] initWithURL:recordingPath settings:[self audioRecordingSettings] error:&error];
    if (error == nil) {
        recorder.delegate = self;
        if ([recorder prepareToRecord] && [recorder record]) {
            //now recording
        }
    }
}

-(NSDictionary*)audioRecordingSettings{
    return [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:kAudioFormatMPEG4AAC], AVFormatIDKey, [NSNumber numberWithInt:16000], AVSampleRateKey, [NSNumber numberWithInt:1], AVNumberOfChannelsKey, AVAudioQualityLow, AVEncoderAudioQualityKey, nil];
}
-(NSURL*)audioRecordingPath{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:&error];
    return [url URLByAppendingPathComponent:@"recording.m4a"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
