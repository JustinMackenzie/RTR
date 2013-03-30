//
//  ScreenManager.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-17.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "ScreenManager.h"
#import "cocos2d.h"
#import "Scenes.h"
#import "Simulator.h"
#import "ObjectSystem.h"
#import "WorldLayer.h"
#import "PauseLayer.h"
#import "GameOverLayer.h"
#import "HUDLayer.h"
#import "SessionManager.h"
#import "BackgroundLayer.h"
#import "SimpleAudioEngine.h"

@implementation ScreenManager

-(id)init
{
	self = [super init];
    
	if (self)
    {
		_director = (CCDirectorIOS *)[CCDirector sharedDirector];
        _currentScene = nil;
	}
    
	return self;
}

-(void)runScene:(NSString *)scene
{
    if([scene isEqualToString:@"Paused"])
    {
        [_currentScene addChild:[[[PauseLayer alloc]initWithInputHandler:[[Simulator SharedSimulator] getInputHandler]] autorelease] z:5 tag:1];
        return;
    }
    else if([scene isEqualToString:@"GameOver"])
    {
        [_currentScene addChild:[[[GameOverLayer alloc] initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]] autorelease] z:5 tag:2];
        return;
    }
    
    CCScene *sceneToRun = nil;
    
    _worldLayer = nil;
    _hudLayer = nil;
    _backgroundLayer = nil;
    _settingsLayer = nil;
    
    if([scene isEqualToString:@"MainMenu"])
    {
        sceneToRun = [[[MainMenuScene alloc]initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]]autorelease];
    }
    else if([scene isEqualToString:@"About"])
    {
        sceneToRun = [[[AboutScene alloc]initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]]autorelease];
    }
    else if([scene isEqualToString:@"How"])
    {
        sceneToRun = [[[HowScene alloc]initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]]autorelease];
    }
    else if([scene isEqualToString:@"Settings"])
    {
        sceneToRun = [[[SettingsScene alloc]initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]]autorelease];
        _settingsLayer = [[(SettingsScene *)sceneToRun GetSettingsLayer] retain];
    }
    else if([scene isEqualToString:@"GameSession"])
    {
        sceneToRun = [[[GameSessionScene alloc]initWithInputHandler:[[Simulator SharedSimulator]getInputHandler]]autorelease];
        _worldLayer = [[(GameSessionScene *)sceneToRun getWorldLayer] retain];
        _hudLayer = [[(GameSessionScene *)sceneToRun getHudLayer] retain];
        _backgroundLayer = [[(GameSessionScene *)sceneToRun getBackgroundLayer] retain];
    }
    
    _currentScene = sceneToRun;
    
    if([_director runningScene])
    {
        [_director replaceScene:[CCTransitionCrossFade transitionWithDuration:0.5 scene:sceneToRun]];
    }
    
}

-(SettingsLayer *)GetSettingsLayer
{
    return _settingsLayer;
}

-(void)Unpause
{
    if(_currentScene)
    {
        [_currentScene removeChildByTag:1 cleanup:YES];
    }
}

-(void)update:(float)dt
{
    if (_worldLayer)
    {
        for (CCSprite *sprite in [[ObjectSystem SharedObjectSystem] GetNewSprites])
        {
            [[(GameSessionScene *)_currentScene getWorldLayer] addChild:sprite];
        }
        
        for(CCSprite *sprite in [[ObjectSystem SharedObjectSystem]GetRemovedSprites])
        {
            [[(GameSessionScene *)_currentScene getWorldLayer] removeChild:sprite cleanup:YES];
        }
    }
    
    if(_hudLayer)
    {
        [_hudLayer SetScoreString:[[[Simulator SharedSimulator] getSessionManager] getScore]];
    }
    
    if(_backgroundLayer)
    {
        [_backgroundLayer update:dt];
    }
}

-(void)dealloc
{
    [_worldLayer release];
    [_hudLayer release];
    [_backgroundLayer release];
    [super dealloc];
}

@end
