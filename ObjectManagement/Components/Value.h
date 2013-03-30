//
//  Value.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-16.
//
//

#import "Component.h"

@interface Value : Component
{
    int _value;
}

-(id)initWithGameObject:(GameObject *)gameObject Value:(int)value;
-(int)GetValue;

@end
