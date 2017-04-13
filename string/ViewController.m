//
//  ViewController.m
//  string
//
//  Created by 张鹏 on 2017/4/11.
//  Copyright © 2017年 张鹏. All rights reserved.
//

#import "ViewController.h"

#import "GDataXMLNode.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *lastString;

@property (nonatomic, copy) NSString *subString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *xmlStr = [@"http://172.30.222.3:43846/dev/50bdb820-5dd0-7bc3-ffff-ffffc7831a22/desc.xml" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   NSString* xml = [NSString stringWithContentsOfURL:[NSURL URLWithString:xmlStr] encoding:NSUTF8StringEncoding error:nil];

    
    GDataXMLDocument* xmlDoc = [[GDataXMLDocument alloc]initWithXMLString:xml options:0 error:nil];
    
    GDataXMLElement *xmlEle = [xmlDoc rootElement];
    NSLog(@"xmlELE = %@",xmlEle);
    
    NSArray *array = [xmlEle elementsForName:@"device"];
    
    for (GDataXMLElement *ele in array) {
        GDataXMLElement *friendlyNameELe = [[ele elementsForName:@"friendlyName"]objectAtIndex:0];
        NSString *friendlyNameStr = [friendlyNameELe stringValue];
        NSLog(@"friendlyNameStr = %@",friendlyNameStr);
        
        GDataXMLElement *iconListELe = [[ele elementsForName:@"iconList"]objectAtIndex:0];
        GDataXMLElement *iconELe = [[iconListELe elementsForName:@"icon"]objectAtIndex:0];
        GDataXMLElement *urlELe = [[iconELe elementsForName:@"url"]objectAtIndex:0];
        NSString *urlStr = [urlELe stringValue];
        NSLog(@"urlStr = %@",urlStr);
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
