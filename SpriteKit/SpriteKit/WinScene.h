//
//  WinScene.h
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SSBitmapFont.h"
#import "SSBitmapFontLabelNode.h"
#import "MyScene.h"
#import "MainScene.h"
#import "GameMechanics.h"
@import AVFoundation;


@interface WinScene : SKScene <UIAlertViewDelegate> {
    SSBitmapFontLabelNode * gameWonLabel;
    SSBitmapFontLabelNode * scoreLabel;
    SSBitmapFontLabelNode * highScoreLabel;
    
    GameMechanics *gameMechanics;
    
    SKSpriteNode *menu;
    SKSpriteNode *replay;
    SKSpriteNode *next;
    SKSpriteNode * share;
    
    NSString * statusText;
    
    NSInteger highscore;
    int tmpScore;
}

-(id)initWithSize:(CGSize)size win: (NSInteger)score;

@end
