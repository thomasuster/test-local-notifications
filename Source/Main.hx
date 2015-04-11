import com.thomasuster.IOSLocalNotifications;
import com.thomasuster.LocalNotifications;
import com.thomasuster.AndroidLocalNotifications;
import com.thomasuster.Notification;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.Lib;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
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

	
}