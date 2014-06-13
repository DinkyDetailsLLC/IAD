//
//  MyScene.h
//  SpriteKit
//

//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SSBitmapFont.h"
#import "SSBitmapFontLabelNode.h"
#import "NSTimer+Pausing.h"
#import "GameMechanics.h"

@interface MyScene : SKScene{
    
    //answer if character is damaged or not
    bool isDamaged;
    bool isGrounded;
    bool isPaused;
    bool isGameOver;
    bool isJumping;
    bool isLifeAvailable;
    bool isScoreOn;
    
    //setting up int for speed
    int speed;
    int lifeSpeed;
    int score;
    int life;
    int scoreRequired;
    float boulderScale;
    float randomNumLife;
    
    
    SKAction *jumpMovement;
    SKAction *jumpAnimation;
    SKSpriteNode *pauseNode;
    SKSpriteNode *player;
    SKSpriteNode *pauseBG;
    SKSpriteNode *menu;
    SKSpriteNode *retry;
    SKSpriteNode *resume;
    
    SKSpriteNode *lifeImage1;
    SKSpriteNode *lifeImage2;
    SKSpriteNode *lifeImage3;
    SKSpriteNode *lifeImage4;
    SKSpriteNode *lifeImage5;
    
    NSTimer * lifeTimer;
    NSTimer * boulderTimer;
    
    
    
    SSBitmapFontLabelNode *scoreLabel;
    SSBitmapFontLabelNode *pausedLabel;
    SSBitmapFontLabelNode *pauseScoreLabel;
    
    
    GameMechanics * gameMechanics;
    //checking how many times the man is hit
    int hitCount;
    ;
}
-(id)initWithSize:(CGSize)size : (int)level;


@end