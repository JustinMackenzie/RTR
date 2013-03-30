//
//  InterfaceManager.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>
#import "Updatable.h"

@class ScreenManager;
@class SoundManager;
@class SettingsLayer;

@interface InterfaceManager : NSObject <Updatable>
{
    ScreenManager *_screenManager;
    SoundManager *_soundManager;
}

+(InterfaceManager *)SharedInterfaceManager;
-(void)runScene:(NSString *)scene;
-(void)Unpause;
-(SettingsLayer *)GetSettingsLayer;

@end
