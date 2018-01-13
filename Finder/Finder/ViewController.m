//
//  ViewController.m
//  Finder
//
//  Created by Aka on 2018/1/13.
//  Copyright © 2018年 Aka. All rights reserved.
//

#import "ViewController.h"
#import "GHMainView.h"

@interface ViewController ()<NSTableViewDataSource,NSTableViewDelegate>

//@property (nonatomic, strong) GHMainView *view;

@property (nonatomic, strong) NSTableView *tableView;


@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

//@dynamic view;
//
//- (void)loadView {
//    self.view = [[GHMainView alloc] initWithFrame:self]];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    _datas = @[@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0",@"niaho0"];
    
}

- (void)viewDidAppear {
    [super viewDidAppear];
    NSLog(@"view did appear");
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}


#pragma mark -- datasource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _datas.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *stdId = [tableColumn identifier];
    NSTableCellView *aView = [tableView makeViewWithIdentifier:stdId owner:self];
    if (!aView) {
        aView = [[NSTableCellView alloc] initWithFrame:CGRectMake(0, 0, tableColumn.width, 100.f)];
    }
    else{
        for (NSView *view in aView.subviews) {
            [view removeFromSuperview];
        }
    }
    NSTextField *textField = [[NSTextField alloc] initWithFrame:CGRectMake(15, 20, 156+50, 17)];
    textField.font = [NSFont systemFontOfSize:15.0f];
    textField.textColor = [NSColor blackColor];
    textField.drawsBackground = NO;
    textField.bordered = NO;
    textField.focusRingType = NSFocusRingTypeNone;
    textField.editable = NO;
    [aView addSubview:textField];
    textField.stringValue = [NSString stringWithFormat:@"%@",[_datas objectAtIndex:row]];
    return aView;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 100.f;
}


@end
