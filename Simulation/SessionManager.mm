//
//  SessionManager.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "SessionManager.h"
#import "ObjectSystem.h"
#import "Vector2f.h"
#import "Tubby.h"
#import "GameStateManager.h"
#import "Health.h"
#import "Simulator.h"

@implementation SessionManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _score = 0;
    }
    
    return self;
}

-(id)initWithGameStateManager:(GameStateManager *)manager
{
    self = [super init];
    
    if(self)
    {
        _gameStateManager = [manager retain];
        _score = 0;
        if([[[Simulator SharedSimulator]Difficulty] isEqualToString:@"Easy"])
        {
            _scrollSpeed = 3.0f;
        }
        else if([[[Simulator SharedSimulator]Difficulty] isEqualToString:@"Medium"])
        {
            _scrollSpeed = 6.0f;
        }
        else
        {
            _scrollSpeed = 9.0f;
        }
        _timeSincePlatformSpawn = 0;
        _timeSinceCoinSpawn = 0;
        _timeSinceBrussellSproutSpawn = 0;
    }
    
    return self;
}

-(void)update:(float)dt
{
    _timeSincePlatformSpawn += dt;
    _timeSinceCoinSpawn += dt;
    _timeSinceBrussellSproutSpawn += dt;
    
    // If tubby has died.
    if(![(Health *)[_tubby GetComponent:@"Health"]Alive])
    {
        [_gameStateManager Done];
    }
    else
    {
        _score += dt * _scrollSpeed;
    }
    [self spawnObjects];
}

-(int)getScore
{
    return _score;
}

-(void)addScore:(int)points
{
    _score += points;
}

-(void)spawnObjects
{
    int numPlatforms = [[[ObjectSystem SharedObjectSystem] GetObjects:@"Platform"] count];
    
    float probability = (_timeSincePlatformSpawn * 4) / (numPlatforms * 0.5f);
    int r = (arc4random() % 100) + 1;
    
    if(r <= probability)
    {
        r = (arc4random() % 3) + 2;
        
        [[ObjectSystem SharedObjectSystem] AddPlatform: r At: [[[Vector2f alloc]initWithX:15 + r And:arc4random() % 8 + 1]autorelease]];
        
        _timeSincePlatformSpawn = 0;
    }
    
    int numCoins = [[[ObjectSystem SharedObjectSystem] GetObjects:@"Coin"] count];
    
    probability = (_timeSinceCoinSpawn * 4) / (numCoins * 0.75f);
    r = (arc4random() % 100) + 1;
    
    if(r <= probability)
    {
        [[ObjectSystem SharedObjectSystem]AddObjectOfType:@"Coin" At:[[[Vector2f alloc]initWithX:16 And:arc4random() % 8 + 1]autorelease]];
        
        _timeSinceCoinSpawn = 0;
    }
    
    int numBS = [[[ObjectSystem SharedObjectSystem] GetObjects:@"BrussellSprout"] count];
    
    probability = (_timeSinceBrussellSproutSpawn * 4) / (numBS * 0.75f);
    r = (arc4random() % 100) + 1;
    
    if(r <= probability)
    {
        [[ObjectSystem SharedObjectSystem]AddObjectOfType:@"BrussellSprout" At:[[[Vector2f alloc]initWithX:16 And:arc4random() % 8 + 1]autorelease]];
        
        _timeSinceBrussellSproutSpawn = 0;
    }
}


-(float)getScrollSpeed
{
    return _scrollSpeed;
}

-(void)setScrollSpeed:(float)scrollSpeed
{
    _scrollSpeed = scrollSpeed;
}

-(void)StartGame
{
    _tubby = [(Tubby *)[[ObjectSystem SharedObjectSystem] AddObjectOfType:@"Tubby" At:[[Vector2f alloc]initWithX:2 And:2]] retain];
    
    [[ObjectSystem SharedObjectSystem] AddPlatform:4 At:[[[Vector2f alloc] initWithX:5 And:0.5] autorelease]];
    //[[ObjectSystem SharedObjectSystem] AddPlatform:4 At:[[[Vector2f alloc] initWithX:5 And:0.5] autorelease]];

    _timeSincePlatformSpawn = 0;
}

-(void)dealloc
{
    [_gameStateManager release];
    [_tubby release];
    [super dealloc];
}

@end
