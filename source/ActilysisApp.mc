//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//
using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class ActilysisApp extends App.AppBase {

    var model;
    var controller;

    function initialize() {
        AppBase.initialize();
        model = new $.ActilysisModel();
        controller = new $.ActilysisController();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new $.ActilysisView(), new $.ActilysisDelegate() ];
    }

}
