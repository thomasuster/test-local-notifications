import flash.events.AccelerometerEvent;
import flash.sensors.Accelerometer;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Sprite;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.media.Sound;
import nme.Assets;
import extension.androidExpansion.AndroidExpansion;

class Main extends Sprite {

	public function new () {
		super ();
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}

    public function onAdded(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        Sys.println("ASDASDASD");
        trace("!!!!!!!!!!!!!!!!!");
        var delivered:Bool = AndroidExpansion.expansionFilesDelivered();
        trace('expansion.expansionFilesDelivered() ' + delivered);
        if(!delivered) {
            trace('expansion.startDownloadServiceIfRequired-started');
            var result:Int = AndroidExpansion.startDownloadServiceIfRequired();
            trace('result = ' + result);
            trace('expansion.startDownloadServiceIfRequired-ended');
        }
        else {
            trace('main file? = ' + AndroidExpansion.getMainFile());
        }
    }
}