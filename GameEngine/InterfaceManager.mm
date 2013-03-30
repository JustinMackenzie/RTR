//
//  InterfaceManager.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "InterfaceManager.h"
#import "ScreenManager.h"
#import "cocos2d.h"
#import "ObjectSystem.h"
#import "Simulator.h"
#import "SoundManager.h"

@implementation InterfaceManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _screenManager = [[ScreenManager alloc]init];
        _soundManager = [[SoundManager alloc]init];
    }
    
    return self;
}

static InterfaceManager *_sharedInterfaceManager = nil;

+(id)alloc
{
    @synchronized([InterfaceManager class])
	{
		NSAssert(_sharedInterfaceManager == nil, @"Attempted to allocate a second instance of an interface manager.");
		_sharedInterfaceManager = [super alloc];
		return _sharedInterfaceManager;
	}
    
	return nil;
}


+(InterfaceManager *)SharedInterfaceManager
{
    @synchronized([InterfaceManager class])
    {
        if(!_sharedInterfaceManager)
        {
            [[self alloc]init];
        }
        
        return _sharedInterfaceManager;
    }
}

-(void)runScene:(NSString *)scene
{
    [_screenManager runScene:scene];
}

-(void)Unpause
{
    [_screenManager Unpause];
}

-(void)update:(float)dt
{
    [_screenManager update:dt];
}

-(SettingsLayer *)GetSettingsLayer
{
    return [_screenManager GetSettingsLayer];
}

-(void)dealloc
{
    [_screenManager release];
    [super dealloc];
}


@end
