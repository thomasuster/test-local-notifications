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

	public function new () {
		
		super ();
        toggleSound();
        stage.addEventListener(MouseEvent.CLICK, onEnter);
	}

    function onEnter(e:Dynamic):Void {
        flag = !flag;
        channel.stop();
        toggleSound();
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