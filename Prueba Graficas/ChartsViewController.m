//
//  ChartsViewController.m
//  Prueba Graficas
//
//  Created by Pedro Contreras Nava on 02/10/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "ChartsViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "ColumnChartDataSource.h"
#import "PieChartDataSource.h"

@interface ChartsViewController ()

@end

@implementation ChartsViewController
@synthesize _chart;
@synthesize _diccionario;
@synthesize columnDataSource;
@synthesize _donutChart;
@synthesize _pieChart;
@synthesize _barChart;
@synthesize pieDataSource;


-(void)prepareColumnChart{

    

    // Create the chart
    if(!self._chart){
    _chart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
    _chart.title = @"Resumen";
    _chart.autoresizingMask =  ~UIViewAutoresizingNone;
    _chart.BackgroundColor = [UIColor clearColor];
    _chart.PlotAreaBackgroundColor = [UIColor clearColor];
    _chart.CanvasAreaBackgroundColor = [UIColor clearColor];
    _chart.gestureDoubleTapResetsZoom = YES;
    _chart.hidden = NO;
    _chart.tag = 1;
    
    _chart.BorderColor = [UIColor clearColor];
    
    _chart.PlotAreaBorderColor = [UIColor clearColor];
    _chart.PlotAreaBorderThickness = 0.f;
    
    // add a pair of axes
    SChartCategoryAxis *xAxis = [[SChartCategoryAxis alloc] init];
    xAxis.style.interSeriesPadding = @0;
    xAxis.enableGesturePanning = YES;
    xAxis.enableGestureZooming = NO;
    
    
    xAxis.allowPanningOutOfDefaultRange =YES   ;
    _chart.xAxis = xAxis;
    
    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] init];
    yAxis.title = @"Inversion (MDP)";
    yAxis.rangePaddingHigh = @1.0;
    yAxis.enableGestureZooming = YES;
    yAxis.enableGesturePanning = YES;
    yAxis.zoomInLimit = 5;
    [yAxis setRangeWithMinimum:@0.5 andMaximum:@15];
    
    _chart.yAxis = yAxis;
    _chart.datasource = columnDataSource;
        _chart.legend.hidden = NO;
        [self.view addSubview:_chart];

    }
    

}

-(void)preparePieChart{
    


    // Create the chart
    if(!self._pieChart){
        _pieChart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
        
        _pieChart.hidden =YES;
        _pieChart.title = @"Resumen";
        _pieChart.autoresizingMask =  ~UIViewAutoresizingNone;
        _pieChart.BackgroundColor = [UIColor clearColor];
        _pieChart.PlotAreaBackgroundColor = [UIColor clearColor];
        _pieChart.CanvasAreaBackgroundColor = [UIColor clearColor];
        _pieChart.gestureDoubleTapResetsZoom = YES;
        
        _pieChart.BorderColor = [UIColor clearColor];
        
        _pieChart.PlotAreaBorderColor = [UIColor clearColor];
        _pieChart.PlotAreaBorderThickness = 0.f;
        _pieChart.tag =2;
        

        _pieChart.datasource = pieDataSource;
        _pieChart.legend.hidden = NO;

        
    
        [self.view addSubview:_pieChart];

    }
    

}


-(void)prepareDonutChart{
    
    
    
    // Create the chart
    if(!self._donutChart){
        _donutChart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
        
        _donutChart.hidden =YES;
        _donutChart.title = @"Resumen";
        _donutChart.autoresizingMask =  ~UIViewAutoresizingNone;
        _donutChart.BackgroundColor = [UIColor clearColor];
        _donutChart.PlotAreaBackgroundColor = [UIColor clearColor];
        _donutChart.CanvasAreaBackgroundColor = [UIColor clearColor];
        _donutChart.gestureDoubleTapResetsZoom = YES;
        
        _donutChart.BorderColor = [UIColor clearColor];
        
        _donutChart.PlotAreaBorderColor = [UIColor clearColor];
        _donutChart.PlotAreaBorderThickness = 0.f;
        _donutChart.tag =3;
        
        
        _donutChart.datasource = pieDataSource;
        _donutChart.legend.hidden = NO;
        [self.view addSubview:_donutChart];
        
    }
    
    
}


-(void)prepareBarChart{
    
    
    
    // Create the chart
    if(!self._barChart){
        _barChart = [[ShinobiChart alloc] initWithFrame:self.view.bounds];
        
        _barChart.hidden =YES;
        _barChart.title = @"Resumen";
        _barChart.autoresizingMask =  ~UIViewAutoresizingNone;
        _barChart.BackgroundColor = [UIColor clearColor];
        _barChart.PlotAreaBackgroundColor = [UIColor clearColor];
        _barChart.CanvasAreaBackgroundColor = [UIColor clearColor];
        _barChart.gestureDoubleTapResetsZoom = YES;
        
        _barChart.BorderColor = [UIColor clearColor];
        
        _barChart.PlotAreaBorderColor = [UIColor clearColor];
        _barChart.PlotAreaBorderThickness = 0.f;
        _barChart.tag =4;
        
        
        _barChart.datasource = columnDataSource;
        _barChart.legend.hidden = NO;
        

        // add a pair of axes
        SChartNumberAxis *xAxis = [[SChartNumberAxis alloc] init];
        xAxis.style.interSeriesPadding = @0;
        xAxis.enableGesturePanning = YES;
        xAxis.enableGestureZooming = YES;
        xAxis.zoomInLimit = 5;
        xAxis.title = @"Inversión (MDP)";
        [xAxis setRangeWithMinimum:@0.5 andMaximum:@15];
        xAxis.rangePaddingHigh = @1.0;


        
        xAxis.allowPanningOutOfDefaultRange =YES   ;
        _barChart.xAxis = xAxis;
        
        SChartCategoryAxis *yAxis = [[SChartCategoryAxis alloc] init];
        yAxis.title = @"Dependencias";
        yAxis.rangePaddingHigh = @1.0;
        yAxis.enableGestureZooming = NO;
        yAxis.enableGesturePanning = YES;
        
        _barChart.yAxis = yAxis;

        
        [self.view addSubview:_barChart];
        
    }
    
    
}

-(void)activateColumn{
    for( ShinobiChart *view in self.view.subviews){
        view.hidden = YES;
    }
    _chart.hidden =NO;
    [_chart redrawChart];
}



-(void)activatePie{
    for( ShinobiChart *view in self.view.subviews){
        view.hidden = YES;
    }
    _pieChart.hidden =NO;
    
    [_pieChart redrawChart];
}


-(void)activateDonut{
    for( ShinobiChart *view in self.view.subviews){
        view.hidden = YES;
    }
    _donutChart.hidden =NO;
    
    [_donutChart redrawChart];
}

-(void)activateBar{
    for( ShinobiChart *view in self.view.subviews){
        view.hidden = YES;
    }
    _barChart.hidden =NO;
    
    [_barChart redrawChart];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _diccionario = @{@"2012": @{@"CONACYT" : @5.65, @"CONAGUA" : @12.6, @"CFE" : @8.4},
                     @"2013": @{@"CONACYT" : @4.35, @"CONAGUA" : @13.2, @"CFE" : @4.6, @"IMSS" : @0.6}};

    

    columnDataSource = [[ColumnChartDataSource alloc]initWithData:_diccionario];
    pieDataSource = [[PieChartDataSource alloc] initWithData:_diccionario];
    [self preparePieChart];
    [self prepareColumnChart];
    [self prepareDonutChart];
    [self prepareBarChart];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
