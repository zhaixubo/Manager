//
//  Manager.m
//  Manager封装
//
//  Created by 翟旭博 on 2022/10/8.
//

#import "Manager.h"

static Manager *manager;

@implementation Manager

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (instancetype)sharedManage {
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    return manager;
}

- (void)NetWorkWithData:(DataBlock)dataBlock error:(ErrorBlock)errorBlock {
    NSString *string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/version/ios/2.3.0"];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            TestModel *country = [[TestModel alloc] initWithData:data error:nil];
            dataBlock(country);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
@end
