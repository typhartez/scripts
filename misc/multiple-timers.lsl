float MINI_TIMER = 2.4;
float CHECK_TIMER = 10.0;
float SENSOR_TIMER = 7.0;

float counter = -1.0;
float counter2 = -1.0;

default {
    timer() {
        counter += MINI_TIMER;
        llOwnerSay("- mini timer (counter is at " + (string)counter + ")");
        if (counter >= CHECK_TIMER) {
            llOwnerSay("# check timer");
            counter = 0.0;
        }
    }
    touch_start(integer n) {
        if (counter >= 0.0) {
            llSensorRemove();
            llSetTimerEvent(0.0);
            counter = -1.0;
            counter2 = -1.0;
        }
        else {
            counter = 0.0;
            counter2 = 0.0;
            llSetTimerEvent(MINI_TIMER);
            llSensorRepeat("THIS_WILL_NEVER_GIVE_A_SENSOR_RESULT", NULL_KEY, AGENT, 0.001, 0.0, SENSOR_TIMER);
        }
    }
    no_sensor() {
        llOwnerSay("# check sensor");
    }
}
