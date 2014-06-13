//
//  MainScene.h
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameCenterManager.h"
#import "LocalHighScores.h"
#import "GameMechanics.h"

@interface MainScene : SKScene{
    GameMechanics * gameMechanics;
}

@property (nonatomic,retain) SKSpriteNode *background;
@property (nonatomic,retain) SKSpriteNode *playButton;
@property (nonatomic,retain) SKSpriteNode *helpButton;

@property (nonatomic,retain) SKSpriteNode *leaderBoardButton;

@property (nonatomic,retain) SKSpriteNode *creditsButton;
@property (nonatomic,retain) SKSpriteNode *highScore;

@end
