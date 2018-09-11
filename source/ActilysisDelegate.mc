using Toybox.WatchUi;

class ActilysisDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new ActilysisMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}