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

	var channel:SoundChannel;

	public function new () {
		
		super ();

//        var sound:Sound = Assets.getMusic('assets/Party_Gu-Jeremy_S-8250_hifi.ogg', false);
//        var soundTransform = new SoundTransform();
//        soundTransform.volume = 0.5;
//        channel = sound.play(0, 10000, soundTransform);
        Reflect.callMethod(this, someMethod, []);
	}

    function someMethod():Void {
        trace("hello world!");
    }
}