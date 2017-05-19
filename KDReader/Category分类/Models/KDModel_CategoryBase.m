//
//  KDModel_CategoryBase.m
//
//  Created by   on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KDModel_CategoryBase.h"


NSString *const kKDModel_CategoryBaseId = @"id";
NSString *const kKDModel_CategoryBaseEnable = @"enable";
NSString *const kKDModel_CategoryBaseName = @"name";
NSString *const kKDModel_CategoryBasePreviews = @"previews";


@interface KDModel_CategoryBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KDModel_CategoryBase

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize enable = _enable;
@synthesize name = _name;
@synthesize previews = _previews;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kKDModel_CategoryBaseId fromDictionary:dict] doubleValue];
            self.enable = [[self objectOrNilForKey:kKDModel_CategoryBaseEnable fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:kKDModel_CategoryBaseName fromDictionary:dict];
            self.previews = [self objectOrNilForKey:kKDModel_CategoryBasePreviews fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kKDModel_CategoryBaseId];
    [mutableDict setValue:[NSNumber numberWithBool:self.enable] forKey:kKDModel_CategoryBaseEnable];
    [mutableDict setValue:self.name forKey:kKDModel_CategoryBaseName];
    NSMutableArray *tempArrayForPreviews = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.previews) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPreviews addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPreviews addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPreviews] forKey:kKDModel_CategoryBasePreviews];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kKDModel_CategoryBaseId];
    self.enable = [aDecoder decodeBoolForKey:kKDModel_CategoryBaseEnable];
    self.name = [aDecoder decodeObjectForKey:kKDModel_CategoryBaseName];
    self.previews = [aDecoder decodeObjectForKey:kKDModel_CategoryBasePreviews];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kKDModel_CategoryBaseId];
    [aCoder encodeBool:_enable forKey:kKDModel_CategoryBaseEnable];
    [aCoder encodeObject:_name forKey:kKDModel_CategoryBaseName];
    [aCoder encodeObject:_previews forKey:kKDModel_CategoryBasePreviews];
}

- (id)copyWithZone:(NSZone *)zone {
    KDModel_CategoryBase *copy = [[KDModel_CategoryBase alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.enable = self.enable;
        copy.name = [self.name copyWithZone:zone];
        copy.previews = [self.previews copyWithZone:zone];
    }
    
    return copy;
}


@end
