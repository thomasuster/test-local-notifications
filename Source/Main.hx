import nme.utils.ByteArray;
import nme.utils.ByteArray;
import nme.display.BitmapData;
import haxe.zip.Reader;
import sys.FileSystem;
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
import extension.androidExpansion.ExpansionReader;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.Lib;
import sys.io.FileInput;
import sys.io.File;
import haxe.zip.Entry;

class Main extends Sprite {

    var version:Int;

	public function new () {
		super ();
        version = 179;
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}

    public function onAdded(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        addImage();
        Sys.println("ASDASDASD");
        trace("!!!!!!!!!!!!!!!!!");
        AndroidExpansion.setKey('MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAul9VjbxKwReCzuLeVfNi1sCrsv/upIiSQsTS+5ToOiFD5tjEHNd4p/m95m4/8wf7aLgTjkhi7w8LTKwm+JVdFl5l4ZADY66Y+klysm95jrYhCHnbNjZIpQp6dKD94pVzo8Hf3d00vB0ZnyVhOZO8aMg9RrJtyzdioJgdMrpBq8yHXL8X/gvD00w/AkqHT+YUAXVn7FwuljMiDSAK15wO/uc/ec37yA4m8zMEK8K4skvzbA9cbAdBp+0PkxK+ep7zxNBtDtfCBJjlW4l1Fb3O7VA3i2abrxeWUnWZu3I51Rj/00h/cUXKz19TE8x/pDsUWUrRPqO5y98MsYctxX2drwIDAQAB');
        AndroidExpansion.setVersion(version);
        AndroidExpansion.setBytes(6342);
        AndroidExpansion.setSalt([1, 42, -12, -1, 99, 98, -100, -12, 43, 2, -8, -4, 9, 5, -106, -107, -33, 45, -1, 84]);
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
            var expansionReader:ExpansionReader = new ExpansionReader();
            expansionReader.version = version;
            addBitmapData(expansionReader.getBitmapData('main-expansion/nme.png'));
            trace('added');
        }
//        tryAddingOBBImage();
    }

    public function addImage():Void {
        addBitmapData(Assets.getBitmapData ("assets/nme.png"));
    }

    function addBitmapData(data:BitmapData):Void {
        var bitmap = new Bitmap (data);
        addChild (bitmap);

        bitmap.x = (Lib.current.stage.stageWidth - bitmap.width) / 2;
        bitmap.y = (Lib.current.stage.stageHeight - bitmap.height) / 2;
    }

//    public function tryAddingOBBImage():Void {
//        var version:Int = 178;
//        var localStoragePath : String = AndroidExpansion.getLocalStoragePath();
//        trace(localStoragePath);
//        var packageName : String = AndroidExpansion.getPackageName();
//        trace(packageName);
//        var assetsDirectory : String = localStoragePath + "/Android/obb/" + packageName + "/";
//        trace(assetsDirectory);
//        var assetsFilePath : String = assetsDirectory + "main." + version + "." + packageName + ".obb";
//
//
//        trace(assetsFilePath);
//
//        if(FileSystem.exists(assetsFilePath)) {
//            var assetsFile : FileInput = File.read( assetsFilePath );
//            var assetsEntries = Reader.readZip( assetsFile );
//
//            var ignoreRootFolder = "";
//            trace('Any entries?');
//            for(entry in assetsEntries) {
//
//                var fileName = entry.fileName;
//                if (fileName.charAt (0) != "/" && fileName.charAt (0) != "\\" && fileName.split ("..").length <= 1) {
//                    var dirs = ~/[\/\\]/g.split(fileName);
//                    if ((ignoreRootFolder != "" && dirs.length > 1) || ignoreRootFolder == "") {
//                        if (ignoreRootFolder != "") {
//                            dirs.shift ();
//                        }
//
//                        var path = "";
//                        var file = dirs.pop();
//                        for( d in dirs ) {
//                            path += d;
////                            sys.FileSystem.createDirectory(_dest + "/" + path);
//                            path += "/";
//                        }
//
//                        if( file == "" ) {
//                            if( path != "" ) trace("created " + path);
//                            continue; // was just a directory
//                        }
//                        path += file;
//                        trace("unzip " + path);
//                        if(path == 'main-expansion/nme.png') {
//                            var data = Reader.unzip(entry);
//                            var byteArray:ByteArray = ByteArray.fromBytes(data);
//                            addBitmapData(BitmapData.loadFromBytes(byteArray));
//                        }
//
//
////                        var f = File.write (_dest + "/" + path, true);
////                        f.write(data);
////                        f.close();
//                    }
//                }
//            } //_entry
//            trace('End of entries');
//
////            var data:Bytes = haxe.zip.Reader.unzip(assetsFilePath)
////            var dataByteArray:Bytes
////            addBitmapData(BitmapData.loadFromBytes(dataByteArray));
//        }
//        else
//            trace('assetsFilePath ' + assetsFilePath + ' does not exist. $assetsFilePath');
//
//        //For bitmaps: return BitmapData.loadFromBytes(dataByteArray);
//        //For text: return Std.string(dataByteArray);
//        /*
//        var snd : Sound = new Sound();
//        snd.loadCompressedDataFromByteArray(dataByteArray, dataByteArray.length);
//        return snd;
//        */
//    }
//
//    function addObbGraphic():Void {
////        var dataBytes : Null<haxe.io.Bytes> = Reader.unzip(assetEntry);
////        var dataByteArray = ByteArray.fromBytes (dataBytes);
////
////        return BitmapData.loadFromBytes(dataByteArray);
//    }
}