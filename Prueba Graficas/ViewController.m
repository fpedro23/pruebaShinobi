//
//  ViewController.m
//  Prueba Graficas
//
//  Created by Pedro Contreras Nava on 02/10/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "ViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ChartsViewController.h"

@interface ViewController ()

- (IBAction)displayColumnChart:(id)sender;
- (IBAction)displayPieChart:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ViewController
@synthesize chartController;
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    chartController = self.childViewControllers.firstObject;
    [segmentedControl setTitle:(@"2013") forSegmentAtIndex:0];
    [segmentedControl setTitle:(@"2014") forSegmentAtIndex:1];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)indexChanged:(UISegmentedControl *)sender {
    chartController.anoSeleccionado = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    NSLog(@"%@",chartController.anoSeleccionado);
}

- (IBAction)displayBubbleChart:(id)sender {
    [chartController activateBar];
}

- (IBAction)displayColumnChart:(id)sender {
    
    [chartController activateColumn];
}

- (IBAction)displayPieChart:(id)sender {
    [chartController activatePie];
}

- (IBAction)displayDonutChart:(id)sender {
    [chartController activateDonut];
}
@end
