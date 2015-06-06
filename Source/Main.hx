import com.thomasuster.AndroidApplovin;
import flash.events.AccelerometerEvent;
import flash.sensors.Accelerometer;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Sprite;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.media.Sound;
import nme.Assets;

class Main extends Sprite {

    var flag:Bool;
	var channel:SoundChannel;
    var a:Accelerometer;
    var i:Int;
    var app:AndroidApplovin;

	public function new () {
		
		super ();
//        toggleSound();
        stage.addEventListener(MouseEvent.CLICK, onEnter);
//        a = new Accelerometer();
//        a.setRequestedUpdateInterval(1);
//        a.addEventListener(AccelerometerEvent.UPDATE, onAccel);

        app = new AndroidApplovin();
        app.init();
        app.preload();
	}

    function asd():Void {
    }

        var lastX:Float;
        var lastY:Float;
    function onAccel(e:AccelerometerEvent):Void {
//        i++;
//        if(i > 10)
//            a.removeEventListener(AccelerometerEvent.UPDATE, onAccel);
//        trace(e.accelerationX + " " + e.accelerationY);
    }

    function onEnter(e:Dynamic):Void {
        trace(app.isReady());
        app.show();
//        flag = !flag;
//        channel.stop();
//        toggleSound();
    }

    function toggleSound():Void {
        var name:String = 'melody_music';
        if(flag)
            name = 'decorate_music';
        var sound:Sound = Assets.getMusic('assets/$name.mp3', false);
        var soundTransform = new SoundTransform();
        soundTransform.volume = 0.5;
        channel = sound.play(0, Math.ceil(0xFFFFFF), soundTransform);
    }

	
}