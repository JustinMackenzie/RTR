//
//  LogoLayer.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-18.
//
//

#import "LogoLayer.h"
#import "MainMenuScene.h"

@implementation LogoLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    
    CCSprite *logo = [CCSprite spriteWithFile:@"AirHammerLogo.png"];
    logo.position = ccp(screenSize.width * 0.5f, screenSize.height * 0.5f);
    [self addChild:logo];
    
    [self scheduleOnce:@selector(makeTransition:) delay:3];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[[[MainMenuScene alloc] initWithInputHandler:_inputHandler] autorelease]  withColor:ccWHITE]];
}

@end
