import flash.media.SoundChannel;
import flash.events.Event;
import com.thomasuster.IOSLocalNotifications;
import com.thomasuster.LocalNotifications;
import com.thomasuster.AndroidLocalNotifications;
import com.thomasuster.Notification;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.Lib;
import flash.media.Sound;
import nme.Assets;

class Main extends Sprite {

    var melody_channel:SoundChannel;
	
	public function new () {
		
		super ();

        var sound:Sound = Assets.getMusic('assets/melody_music.ogg', false);
        melody_channel = sound.play(4000);
        addEventListener(Event.ENTER_FRAME, onFrame);

		var bitmap = new Bitmap (Assets.getBitmapData ("assets/nme.png"));
		addChild (bitmap);
		
		bitmap.x = (Lib.current.stage.stageWidth - bitmap.width) / 2;
		bitmap.y = (Lib.current.stage.stageHeight - bitmap.height) / 2;

        var localNotofications:LocalNotifications;

        #if android
        localNotofications = new AndroidLocalNotifications();
        #elseif ios
        localNotofications = new IOSLocalNotifications();
        #else
        return;
        #end

        var notification:Notification = new Notification();
        notification.id = 0;
        notification.title = 'Eureka!';
        notification.textContent = 'Hello Hugh';
        notification.milliseconds = 0;
        localNotofications.schedule(notification);
    }

    var num = 0;

    function onFrame(e:Event):Void {
        num++;
        if(num == 60) {
            trace('melody_channel.position = ' + melody_channel.position);
            melody_channel.stop();
            var sound:Sound = Assets.getMusic('assets/evolve_music.ogg', false);
            sound.play();
            trace('asd!');
        }
    }
	
}