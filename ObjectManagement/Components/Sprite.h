//
//  Sprite.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "Component.h"
#import "cocos2d.h"

@interface Sprite : Component
{
    NSMutableDictionary *_dictionary;
}

-(id)initWithGameObject:(GameObject *)gameObject;

-(void)AddSprite:(CCSprite *)sprite Key:(NSString *)key;

-(CCSprite *)GetSprite:(NSString *)key;

-(NSArray *)GetAllSprites;

@end
