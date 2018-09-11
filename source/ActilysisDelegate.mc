//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//
using Toybox.WatchUi as Ui;
using Toybox.ActivityRecording;
using Toybox.Application;

// The NamasteDelegate forwards the inputs to the
// NamasteController. One might say it _delegates_
// its responsibilities... what, okay, I'll stop
class ActilysisDelegate extends Ui.BehaviorDelegate {

    // Controller class
    var mController;

    // Constructor
    function initialize() {
        // Initialize the superclass
        BehaviorDelegate.initialize();
        // Get the controller from the application class
        mController = Application.getApp().controller;
    }

    // Input handling of start/stop is mapped to onSelect
    function onSelect() {
        // Pass the input to the controller
        mController.onStartStop();
        return true;
    }

    // Block access to the menu button
    function onMenu() {
        return true;
    }
    
    // Handle the back action
    function onBack() {
       // If the timer is running, confirm they want to exit
       if(mController.isRunning()) {
           WatchUi.pushView(new WatchUi.Confirmation("Are you sure?"),
               new NamasteConfirmationDelegate(mController), WatchUi.SLIDE_IMMEDIATE );
           // Don't let the system handle the message!
           return true;
       }
       // Pass the message through to the system
       return false;
    }
}

// Confirmation delegate used by the NamasteDelegate
class NamasteConfirmationDelegate extends Ui.ConfirmationDelegate
{
   hidden var mController;

    // Hold onto the controller
   function initialize(controller) {
       ConfirmationDelegate.initialize();
       mController = controller;
    }

    // Handle the confirmation dialog response
   function onResponse(response) {
       if( response == WatchUi.CONFIRM_YES ) {
           mController.stop();
           mController.discard();
       }
    }
}
