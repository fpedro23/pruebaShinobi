//
//  ChartsViewController.h
//  Prueba Graficas
//
//  Created by Pedro Contreras Nava on 02/10/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShinobiChart;
@class ColumnChartDataSource;
@class PieChartDataSource;

@interface ChartsViewController : UIViewController
@property  NSDictionary* _diccionario;
@property  ShinobiChart * _chart;
@property ShinobiChart * _pieChart;
@property ShinobiChart * _donutChart;
@property ShinobiChart * _barChart;
@property NSString * anoSeleccionado;


@property ColumnChartDataSource * columnDataSource;
@property PieChartDataSource * pieDataSource;

-(void)activateColumn;
-(void)activatePie;
-(void)activateDonut;
-(void)activateBar;



@end
