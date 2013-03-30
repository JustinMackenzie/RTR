//
//  IntroductionLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "IntroductionLayer.h"
#import "LogoScene.h"
#import "SimpleAudioEngine.h"

@implementation IntroductionLayer

-(void)BuildLayer
{
    CCLayerColor *background = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 100)];
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"soLid-Xciter_Escape-160.mp3" loop:YES];
    
	// add the label as a child to this Layer
	[self addChild: background];
}

-(void) onEnter
{
	[super onEnter];
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[[[LogoScene alloc] initWithInputHandler:_inputHandler] autorelease]  withColor:ccBLACK]];
}


@end
