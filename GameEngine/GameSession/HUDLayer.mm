//
//  HUDLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "HUDLayer.h"

@implementation HUDLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    CCMenuItemImage *pauseButton = [CCMenuItemImage itemWithNormalImage:@"pause.png" selectedImage:nil target:_inputHandler selector:@selector(PausePressed:)];
    pauseButton.position = ccp(screenSize.width * 0.93f, screenSize.height * 0.895f);
    
    CCMenuItemImage *jumpButton = [CCMenuItemImage itemWithNormalImage:@"jump.png" selectedImage:nil target:_inputHandler selector:@selector(JumpPressed:)];
    jumpButton.position = ccp(screenSize.width * 0.93f, screenSize.height * 0.105);
    
    CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, jumpButton, nil];
    hudMenu.position = CGPointZero;
    
    _score = [CCLabelTTF labelWithString:@"Score" fontName:@"Action Man" fontSize:24];
    _score.position = ccp(screenSize.width * 0.15f, screenSize.height * 0.90f);
    _score.color = ccBLACK;
    
    [self addChild:hudMenu];
    [self addChild:_score z:5];
}

-(void)SetScoreString:(int)score
{
    [_score setString:[NSString stringWithFormat:@"Score: %d", score]];
}

@end
