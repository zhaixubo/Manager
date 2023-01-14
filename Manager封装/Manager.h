//
//  Manager.h
//  Manager封装
//
//  Created by 翟旭博 on 2022/10/8.
//

#import "JSONModel.h"
#import "TestModel.h"

typedef void (^DataBlock) (TestModel* _Nonnull mainViewModel);
typedef void (^ErrorBlock) (NSError* _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface Manager : JSONModel

+ (instancetype)sharedManage;
- (void)NetWorkWithData:(DataBlock) dataBlock error:(ErrorBlock) errorBlock;

@end

NS_ASSUME_NONNULL_END
