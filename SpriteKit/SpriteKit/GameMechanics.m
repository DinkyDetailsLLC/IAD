//
//  GameMechanics.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "GameMechanics.h"


@implementation GameMechanics

@synthesize mainViewDelegate;




- (int) GetActiveLevel
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"activeLevel"]intValue];
}

- (void) setActiveLevel:(int)level
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:level] forKey:@"activeLevel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(void)setLocalScores: (int)Score{
if (Score>[self getLocalScore1]) {
    localScore[4]=[self getLocalScore4];
    localScore[3]=[self getLocalScore3];
    localScore[2]=[self getLocalScore2];
    localScore[1]=[self getLocalScore1];
    localScore[0]=Score;

    [[NSUserDefaults standardUserDefaults] setInteger:localScore[0] forKey:@"localScore1"];

    [[NSUserDefaults standardUserDefaults] setInteger:localScore[1] forKey:@"localScore2"];

    [[NSUserDefaults standardUserDefaults] setInteger:localScore[2] forKey:@"localScore3"];

    [[NSUserDefaults standardUserDefaults] setInteger:localScore[3] forKey:@"localScore4"];

    [[NSUserDefaults standardUserDefaults] setInteger:localScore[4] forKey:@"localScore5"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
else if (Score>[self getLocalScore2]){

    localScore[4]=[self getLocalScore4];
    localScore[3]=[self getLocalScore3];
    localScore[2]=[self getLocalScore2];
    localScore[1]=Score;
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[1] forKey:@"localScore2"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[2] forKey:@"localScore3"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[3] forKey:@"localScore4"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[4] forKey:@"localScore5"];
    [[NSUserDefaults standardUserDefaults] synchronize];

} else if(Score>[self getLocalScore3]){

    localScore[4]=[self getLocalScore4];
    localScore[3]=[self getLocalScore3];
    localScore[2]=Score;
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[2] forKey:@"localScore3"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[3] forKey:@"localScore4"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[4] forKey:@"localScore5"];
    [[NSUserDefaults standardUserDefaults] synchronize];

} else if (Score>[self getLocalScore4]){

    localScore[4]=[self getLocalScore4];
    localScore[3]=Score;
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[3] forKey:@"localScore4"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[4] forKey:@"localScore5"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
} else if (Score > [self getLocalScore5]){

    localScore[4]= Score;
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:localScore[4] forKey:@"localScore5"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

}


- (int)getLocalScore1
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"localScore1"]intValue];
}

- (int)getLocalScore2
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"localScore2"]intValue];
}

- (int) getLocalScore3
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"localScore3"]intValue];
}

- (int) getLocalScore4
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"localScore4"]intValue];
}

- (int) getLocalScore5
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"localScore5"]intValue];
}


- (int)getTotalScore
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"totalScore"] intValue];
}


-(void)addTotalScore:(int)Score
{
  Score = [self getTotalScore] + Score;
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:Score] forKey:@"totalScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)setTotalScore:(int)Score{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:Score] forKey:@"totalScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (BOOL)getMedal :(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"%@", key]];
}

-(void)setMedal :(BOOL)boolean :(NSString*)key{
    [[NSUserDefaults standardUserDefaults] setBool:boolean forKey:[NSString stringWithFormat:@"%@", key]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
