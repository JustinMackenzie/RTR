//
//  ObjectFactory.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "ObjectFactory.h"
#import "GameObject.h"
#import "Vector2f.h"
#import "GameObjects.h"
#import "Simulator.h"
#import "SessionManager.h"

@implementation ObjectFactory

-(GameObject *)CreateGameObjectOfType:(NSString *)type AtPosition:(Vector2f *)position
{
    GameObject *result = nil;
    
    if([type isEqualToString:@"Tubby"])
    {
        result = [[[Tubby alloc]initWithTag:@"Tubby" Position:position World:[[Simulator SharedSimulator] GetWorld]] autorelease];
    }
    else if ([type isEqualToString:@"Coin"])
    {
        result = [[[Coin alloc]initWithTag:@"Coin" Position:position World:[[Simulator SharedSimulator]GetWorld] Value:100 Velocity:[[[Vector2f alloc]initWithX:[[[Simulator SharedSimulator] getSessionManager] getScrollSpeed] And:0] autorelease]] autorelease];
    }
    else if([type isEqualToString:@"BrussellSprout"])
    {
        result = [[[BrussellSprout alloc]initWithTag:@"BrussellSprout" Position:position World:[[Simulator SharedSimulator]GetWorld] Velocity:[[[Vector2f alloc]initWithX:[[[Simulator SharedSimulator]getSessionManager]getScrollSpeed] And:0] autorelease]] autorelease];
    }
    
    return [result autorelease];
}

-(GameObject *)AddPlatform:(int)size At:(Vector2f *)position
{
    GameObject *result = [[[Platform alloc]initWithTag:@"Platform" Position:position Speed:[[[Simulator SharedSimulator] getSessionManager] getScrollSpeed] World:[[Simulator SharedSimulator] GetWorld] Size:size] autorelease];
    
    return result;
}

@end
