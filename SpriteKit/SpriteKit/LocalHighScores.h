//
//  LocalHighScores.h
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameMechanics.h"
#import "SSBitmapFont.h"
#import "SSBitmapFontLabelNode.h"
#import "MainScene.h"

@interface LocalHighScores : SKScene
{
    
    NSDate * date1, *date2, *date3, *date4, *date5;
    
    GameMechanics * gameMechanics;
    
    SSBitmapFontLabelNode * localScoreLabel1;
    SSBitmapFontLabelNode * localScoreLabel2;
    SSBitmapFontLabelNode * localScoreLabel3;
    SSBitmapFontLabelNode * localScoreLabel4;
    SSBitmapFontLabelNode * localScoreLabel5;
    
    SKSpriteNode * bronze;
    SKSpriteNode * silver;
    SKSpriteNode * gold;
    SKSpriteNode * platinum;
    SKSpriteNode * diamond;

}
@property (nonatomic,retain) SKSpriteNode * backButton;

@end
