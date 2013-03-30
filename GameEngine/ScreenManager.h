//
//  ScreenManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-17.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Updatable.h"

@class CCDirectorIOS;
@class WorldLayer;
@class CCScene;
@class HUDLayer;
@class BackgroundLayer;
@class SettingsLayer;

@interface ScreenManager : NSObject <Updatable>
{
    CCDirectorIOS *_director;
    WorldLayer *_worldLayer;
    CCScene *_currentScene;
    HUDLayer *_hudLayer;
    BackgroundLayer *_backgroundLayer;
    SettingsLayer *_settingsLayer;
}

-(void)runScene:(NSString *)scene;
-(void)update:(float)dt;
-(void)Unpause;
-(SettingsLayer *)GetSettingsLayer;


@end
