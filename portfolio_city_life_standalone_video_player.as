// sets the colour for components (scrollbars) to red when pressed
_global.style.setStyle("themeColor", 0x5A6F83);

// define global variables
_global.myFlag = false;
_global.fullscreen_menu_var = false;

var newtitle = _level0.variable1;

// initiliaze buttons

if (_level0.variable2 == "music") {
    button_cover_music.swapDepths(50);
    button_cover._visible = false;
    now_buffering.foreground._visible = false;
    attachMovie("btn_rewind_music", "rewind_button", 1, {_y:275.7, _x:33.2});
    attachMovie("btn_play_pause_music", "play_pause", 2, {_y:275.8, _x:52.6});
    attachMovie("btn_sound_on_off_music", "sound_on_off", 3, {_y:300.4, _x:52.1});
    attachMovie("btn_email_music", "email_button", 4, {_y:299.4, _x:150});
    attachMovie("btn_link_music", "link_button", 5, {_y:299.4, _x:210});
    attachMovie("btn_menu_music", "menu_button", 6, {_y:275.7, _x:408.0});
    if (_level0.variable3 != "") {
        attachMovie("btn_save_music", "save_button", 7, {_y:291.4, _x:362});
    }
} else {
    bg._visible = false;
    button_cover.swapDepths(50);
    button_cover_music._visible = false;
    loader.loader_frame_music._visible = false;
    mySlider.loader_frame_music._visible = false;
    now_buffering.frame_music._visible = false;
    now_buffering.foreground_music._visible = false;
    attachMovie("btn_rewind", "rewind_button", 1, {_y:275.7, _x:33.2});
    attachMovie("btn_play_pause", "play_pause", 2, {_y:275.8, _x:52.6});
    attachMovie("btn_sound_on_off", "sound_on_off", 3, {_y:300.4, _x:52.1});
    attachMovie("btn_email", "email_button", 4, {_y:299.4, _x:150});
    attachMovie("btn_link", "link_button", 5, {_y:299.4, _x:210});
    attachMovie("btn_menu", "menu_button", 6, {_y:275.7, _x:408.0});
    if (_level0.variable3 != "") {
        attachMovie("btn_save", "save_button", 7, {_y:291.4, _x:362});
    }
};

sound_on_off.sound_off._visible = false;
sound_on_off.sound_off_over._visible = false;
sound_on_off.sound_on_over._alpha = 0;
sound_on_off.sound_off_over._alpha = 0;
fullscreen_menu.sound_on_off_fullscreen.sound_off._visible = false;
fullscreen_menu.sound_on_off_fullscreen.sound_off_over._visible = false;
fullscreen_menu.sound_on_off_fullscreen.sound_on_over._alpha = 0;
fullscreen_menu.sound_on_off_fullscreen.sound_off_over._alpha = 0;
play_pause.pause_image._visible = false;
play_pause.pause_image_over._visible = false;
play_pause.pause_image_over._alpha = 0;
play_pause.play_image_over._alpha = 0;
rewind_button.image_over._visible = false;
email_button.image_over._visible = false;
link_button.image_over._visible = false;
menu_button.image_over._visible = false;
save_button.image_over._visible = false;
now_buffering._visible = false;

// initiliaze fullscreen menu
fullscreen_menu.swapDepths(205);
fullscreen_menu._y = 10000;
fullscreen_menu._alpha = 0;

// By use of this code snippet, I agree to the Brightcove Publisher T&C
// found at http://www.brightcove.com/publishertermsandconditions.html.

/****** Start of Brightcove Player ******/

/*
* feel free to edit these configurations
* to modify the player experience
*/
var config = new Object();
config["videoId"] = newtitle;
//the default video loaded into the player
config["videoRef"] = null;
//the default video loaded into the player by ref id specified in console
config["lineupId"] = null;
//the default lineup loaded into the player
config["playerTag"] = null;
//player tag used for identifying this page in brightcove reporting
config["autoStart"] = false;
//tells the player to start playing video on load
/*
* if your player is resizable, you may pass new dimensions here;
* these dimensions will be ignored in locked-size templates
*/
config["width"] = 450;
config["height"] = 253;
config["disableJavascriptAPI"] = true;
/*
* onLoadInit is called when the player loads;
* at that point, the onTemplateLoaded handler can be assigned a function;
* when onTemplateLoaded is fired, any of the API functions become
available;
* the onTemplateLoadStart and onTemplateLoadProgress handlers can be used
* to track the load progress of the player template
*/
var movie:MovieClip = this;
var bcln:Object = new Object();

bcln.onLoadInit = function(player:MovieClip):Void {
    if (player != bcPlayer) {
        bcPlayer.unloadMovie();
    }
    bcPlayer = player;
    bcPlayer.onTemplateLoaded = initializePlayer;

    bcPlayer.onTemplateLoadStart = function() {
    };

    bcPlayer.onTemplateLoadProgress = function(bytesLoaded:Number, bytesTotal:Number) {
    };

    bcPlayer._x = 0;
    bcPlayer._y = 0;
};

bcln.onLoadProgress = function(player:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void {
// place preload feedback here for shell movie
};

/* It is not recommended to modify the code below here */
config["playerId"] = 1459162515;
config["flashId"] = "brightcove_8"; // determines under which id the SWF will be embedded in the HTML
System.security.allowDomain("http://admin.brightcove.com");
createPlayer(config);

function createPlayer(config) {
    var servicesURL:String = "http://services.brightcove.com/services";
    var cdnURL:String = "http://admin.brightcove.com";
    var configItems = "";
    for (var i in config) {
        if (i == "flashId" || i == "width" || i == "height") continue;
        configItems += "&" + i + "=" + escape(config[i]);
    }
    var swfFile:String = "federated_f8.swf";
    var file:String = cdnURL + "/viewer/" + swfFile + "?" +
        "flashId="+escape(config["flashId"])+
        "&cdnURL="+escape(cdnURL)+
        "&servicesURL="+escape(servicesURL)+
        "&playerWidth="+escape(config["width"])+
        "&playerHeight="+escape(config["height"])+
        "&ord="+(new Date().getTime())+
        configItems+
        "&buildNumber=" + 25;
    var depth:Number = this.getNextHighestDepth();
    var player:MovieClip = createEmptyMovieClip("bcPlayer"+depth, depth);
    if (bcPlayer == null) bcPlayer = player;
//use mcl to create a preloader for the Brightcove player
    var mcl:MovieClipLoader = new MovieClipLoader();
    mcl.addListener(bcln);
    mcl.loadClip(file, player);
}

/****** End of Brightcove Player ******/

initializePlayer = function () {
// fired after onTemplateLoaded
    bcPlayer.setVideoPlayerDelegate(createConnection);
    bcPlayer.addEventListener("contentLoad", _root, "onContentLoad");
    bcPlayer.addEventListener("play", _root, "countPlay");
};

// count videos start
function countPlay() {
    if (myFlag == false) {
        var send_lv:LoadVars = new LoadVars();
        var result_lv:LoadVars = new LoadVars();
// send start play to database
        send_lv.id = newtitle;
        send_lv.sendAndLoad("/video/increment_views", result_lv, "GET");
// prevent multiple counts when a video is only paused
        myFlag = true;
    };
};
// count videos end

function onContentLoad(infoObj:Object):Void {
// set title
    myCurrentTitle = bcPlayer.getCurrentTitle();

// show buttons
    button_cover._visible = false;
    button_cover_music._visible = false;

// volume slider start
    mySlider.ratio = 0;
    fullscreen_menu.mySlider_fullscreen.ratio = 0;

    mySlider.dragger.onPress = function() {
        if (sound_on_off.sound_on._visible == false) {
            sound_on_off.sound_on._visible = true;
            sound_on_off.sound_on_over._visible = true;
            sound_on_off.sound_off._visible = false;
            sound_on_off.sound_off_over._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_on._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_on_over._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_off._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_off_over._visible = false;
        }
        mySlider.dragger.startDrag(true, 0, 0, mySlider.line._width, 0);

        mySlider.dragger.onEnterFrame = function() {
            ratio = Math.round(this._x*100/mySlider.line._width);
            mySlider.volume_active._width = (ratio/100) * mySlider.line._width;
            fullscreen_menu.mySlider_fullscreen.volume_active._width = (ratio/100) * fullscreen_menu.mySlider_fullscreen.line._width;
            fullscreen_menu.mySlider_fullscreen.dragger._x = fullscreen_menu.mySlider_fullscreen.volume_active._width;
            bcPlayer.setVolume(ratio);

            this.onMouseUp = function(){
                stopDrag();
                delete this.onMouseUp;
                delete this.onEnterFrame;
            }

        }

    };

// volume slider end

// dragger on fullscreen view start
    fullscreen_menu.mySlider_fullscreen.dragger.onPress = function() {
        if (fullscreen_menu.sound_on_off_fullscreen.sound_on._visible == false) {
            fullscreen_menu.sound_on_off_fullscreen.sound_on._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_on_over._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_off._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_off_over._visible = false;
            sound_on_off.sound_off._visible = false;
            sound_on_off.sound_off_over._visible = false;
            sound_on_off.sound_on._visible = true;
            sound_on_off.sound_on_over._visible = true;
        }
        fullscreen_menu.mySlider_fullscreen.dragger.startDrag(true, 0, 0, fullscreen_menu.mySlider_fullscreen.line._width, 0);

        fullscreen_menu.mySlider_fullscreen.dragger.onEnterFrame = function() {
            ratio = Math.round(this._x*100/fullscreen_menu.mySlider_fullscreen.line._width);
            fullscreen_menu.mySlider_fullscreen.volume_active._width = (ratio/100) * fullscreen_menu.mySlider_fullscreen.line._width;
// set standard view slider to match fullscreen slider
            mySlider.volume_active._width = (ratio/100) * mySlider.line._width;
            mySlider.dragger._x = mySlider.volume_active._width;
            bcPlayer.setVolume(ratio);

            this.onMouseUp = this.onReleaseOutside = function(){
                stopDrag();
                delete this.onMouseUp;
                delete this.onEnterFrame;
            }

        }

    };

// dragger on fullscreen view end

// mute button start

    sound_on_off.onPress = fullscreen_menu.sound_on_off_fullscreen.onPress = function() {
        if (sound_on_off.sound_off._visible == false) {
            oldVolume = bcPlayer.getVolume();
            bcPlayer.setVolume(0);
            sound_on_off.sound_off._visible = true;
            sound_on_off.sound_off_over._visible = true;
            sound_on_off.sound_on._visible = false;
            sound_on_off.sound_on_over._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_off._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_off_over._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_on._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_on_over._visible = false;
        } else {
            bcPlayer.setVolume(oldVolume);
            sound_on_off.sound_off._visible = false;
            sound_on_off.sound_off_over._visible = false;
            sound_on_off.sound_on._visible = true;
            sound_on_off.sound_on_over._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_off._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_off_over._visible = false;
            fullscreen_menu.sound_on_off_fullscreen.sound_on._visible = true;
            fullscreen_menu.sound_on_off_fullscreen.sound_on_over._visible = true;
        };
    };

    sound_on_off.onRollOver = function() {
        sound_on_off.sound_on_over._alpha = 100;
        sound_on_off.sound_off_over._alpha = 100;
	};

    sound_on_off.onRollOut = sound_on_off.onReleaseOutside = function() {
        sound_on_off.sound_on_over._alpha = 0;
        sound_on_off.sound_off_over._alpha = 0;
    };

    fullscreen_menu.sound_on_off_fullscreen.onRollOver = function() {
        fullscreen_menu.sound_on_off_fullscreen.sound_on_over._alpha = 100;
        fullscreen_menu.sound_on_off_fullscreen.sound_off_over._alpha = 100;
	};

    fullscreen_menu.sound_on_off_fullscreen.onRollOut = fullscreen_menu.sound_on_off_fullscreen.onReleaseOutside = function() {
        fullscreen_menu.sound_on_off_fullscreen.sound_on_over._alpha = 0;
        fullscreen_menu.sound_on_off_fullscreen.sound_off_over._alpha = 0;

    };

// mute button end

// rewind button

    rewind_button.onPress = function() {
        bcPlayer.seek(0);
        bcPlayer.pauseVideo(true);
    }

    rewind_button.onRollOver = function() {
        rewind_button.image_over._visible = true;
    };

    rewind_button.onRollOut = rewind_button.onReleaseOutside = function() {
        rewind_button.image_over._visible = false;
    };


//	play / pause button

    play_pause.onPress = function() {
        if (bcPlayer.isPlaying() == true) {
            bcPlayer.pauseVideo();
        } else {
            bcPlayer.startVideo();
            countPlay();
        };
    };

    play_pause.onRollOver = function() {
        play_pause.pause_image_over._alpha = 100;
        play_pause.play_image_over._alpha = 100;
    };

    play_pause.onRollOut = play_pause.onReleaseOutside = function() {
        play_pause.pause_image_over._alpha = 0;
        play_pause.play_image_over._alpha = 0;
    };

    onEnterFrame = function () {
// corrects bug in volume slider on fullscreen not always having a match between width of volume bar and dragger
        fullscreen_menu.mySlider_fullscreen.dragger._x = (ratio/100) * fullscreen_menu.mySlider_fullscreen.line._width;

// play/pause button image swap start
        if (bcPlayer.isPlaying() == true) {
            play_pause.pause_image._visible = true;
            play_pause.pause_image_over._visible = true;
            play_pause.play_image._visible = false;
            play_pause.play_image_over._visible = false;
        } else {
            play_pause.pause_image._visible = false;
            play_pause.pause_image_over._visible = false;
            play_pause.play_image._visible = true;
            play_pause.play_image_over._visible = true;
        };

// play/pause button image swap end

// buffering start
        bcPlayer.addEventListener("buffering", this, "onBuffering");
        if (loader.playback._width > 0.1) {
            now_buffering._visible = false;
        };
// buffering end

// turn off the menu when in fullscreen start
        if (Stage["displayState"] == "fullScreen") {
// get current mouse positions
            mouseXnow = _root._xmouse;
            mouseYnow = _root._ymouse;
// check if mouse isn't moving
            if (mouseXnow-mouseXthen == 0 && mouseXnow-mouseXthen == 0) {
                i++;
// 20 is the timing delay
                if (i>=10) {
                    fullscreen_menu_var = false;
                    fullscreen_menu.onEnterFrame = function () {
                        if (this._alpha>0) {
                            this._alpha -= 20;
                        } else {
                            delete this.onEnterFrame;
                            fullscreen_menu._y = 10000;
                            Mouse.hide();
                        };
                    };
                };
            } else {
//            _root.myMovieClip.something = false;
                i = 0;
            };
// set previous mouse positions
            mouseXthen = mouseXnow;
            mouseYthen = mouseYnow;

// fullscreen menu button - rewind
            fullscreen_menu.rewind_button_fullscreen.onPress = function() {
                bcPlayer.seek(0);
                bcPlayer.pauseVideo(true);
            };

// fullscreen menu button - play / pause
            fullscreen_menu.play_pause_fullscreen.onPress = function() {
                if (bcPlayer.isPlaying() == true) {
                    bcPlayer.pauseVideo();
                } else {
                    bcPlayer.startVideo();
                };
            };

            if (bcPlayer.isPlaying() == true) {
                fullscreen_menu.play_pause_fullscreen.pause_image._visible = true;
                fullscreen_menu.play_pause_fullscreen.pause_image_over._visible = true;
                fullscreen_menu.play_pause_fullscreen.play_image._visible = false;
                fullscreen_menu.play_pause_fullscreen.play_image_over._visible = false;
            } else {
                fullscreen_menu.play_pause_fullscreen.pause_image._visible = false;
                fullscreen_menu.play_pause_fullscreen.pause_image_over._visible = false;
                fullscreen_menu.play_pause_fullscreen.play_image._visible = true;
                fullscreen_menu.play_pause_fullscreen.play_image_over._visible = true;
            };

            fullscreen_menu.play_pause_fullscreen.onRollOver = function() {
                fullscreen_menu.play_pause_fullscreen.pause_image_over._alpha = 100;
                fullscreen_menu.play_pause_fullscreen.play_image_over._alpha = 100;
            };

            fullscreen_menu.play_pause_fullscreen.onRollOut = fullscreen_menu.play_pause_fullscreen.onReleaseOutside = function() {
                fullscreen_menu.play_pause_fullscreen.pause_image_over._alpha = 0;
                fullscreen_menu.play_pause_fullscreen.play_image_over._alpha = 0;
            };
        } else {
// ensure menu is removed when not in fullscreen mode
            _root.new_fullscreen_menu.removeMovieClip();
            fullscreen_menu_var = false;
            Mouse.show();
        };
// turn off the menu when in fullscreen end

    };

// email button
    email_button.onPress = function() {
        bcPlayer.showBrightcoveMenuPage("EMAIL", videoId);
    };

    email_button.onRollOver = function() {
        email_button.image_over._visible = true;
    };

    email_button.onRollOut = email_button.onReleaseOutside = function() {
        email_button.image_over._visible = false;
    };

// link button
    link_button.onPress = function() {
        bcPlayer.showBrightcoveMenuPage("LINK", videoId);
    };

    link_button.onRollOver = function() {
        link_button.image_over._visible = true;
    };

    link_button.onRollOut = link_button.onReleaseOutside = function() {
        link_button.image_over._visible = false;
    };

// menu button
    var menuVar:String = "off";
	
    menu_button.onPress = function() {
        if (menuVar == "on") {
            bcPlayer.showBrightcoveMenu(false);
            menuVar = "off";
        } else {
            bcPlayer.showBrightcoveMenu(true);
            menuVar = "on";
        };
    };

    menu_button.onRollOver = function() {
        menu_button.image_over._visible = true;
    };

    menu_button.onRollOut = menu_button.onReleaseOutside = function() {
        menu_button.image_over._visible = false;
    };

// save button

    save_button.onPress = function() {
        var send_save_vars:LoadVars = new LoadVars();
        var result_save_vars:LoadVars = new LoadVars();
        send_save_vars.video = newtitle;
//        send_save_vars.sendAndLoad("/profile/User/add_video/" + newtitle + "/", result_save_vars, "GET");
        send_save_vars.sendAndLoad(_level0.variable3, result_save_vars, "GET");
    }

    save_button.onRollOver = function() {
        save_button.image_over._visible = true;
    };

    save_button.onRollOut = save_button.onReleaseOutside = function() {
        save_button.image_over._visible = false;
    };


// code for scrubber from gotoandlearn.com start

    var videoInterval = setInterval(videoStatus,100);
    var amountLoaded:Number;
    var duration:Number;

    function videoStatus(){
        myVideoPosition = bcPlayer.getVideoPosition(true);
        myVideoPositionSec = bcPlayer.getVideoPosition();
        myVideoBytesLoaded = bcPlayer.getVideoBytesLoaded();
        myVideoLength = myCurrentTitle.length;
// get number of bytes already loaded
        myVideoBytesTotal = bcPlayer.getVideoBytesTotal();
// get total number of bytes
        time_txt.text = fullscreen_menu.time_txt_fullscreen.text = convertToTimeString(myVideoPositionSec);
        amountLoaded = myVideoBytesLoaded / myVideoBytesTotal;
        loader.loadbar._width = amountLoaded * loader.loader_frame._width;
        loader.scrub._x = (myVideoPositionSec*1000) / myVideoLength * loader.loader_frame._width;
        loader.playback._width = (myVideoPositionSec*1000) / myVideoLength * loader.loader_frame._width;
        fullscreen_menu.loader2.loadbar._width = amountLoaded * fullscreen_menu.loader2.loader_frame._width;
        fullscreen_menu.loader2.scrub._x = (myVideoPositionSec*1000) / myVideoLength * fullscreen_menu.loader2.loader_frame._width;
        fullscreen_menu.loader2.playback._width = (myVideoPositionSec*1000) / myVideoLength * fullscreen_menu.loader2.loader_frame._width;
    };

    var scrubInterval;

    loader.scrub.onPress = function() {
        clearInterval(videoInterval);
        scrubInterval = setInterval(scrubit,10);
        this.startDrag(false,0,this._y,loader.loader_frame._width,this._y);
    };

    loader.scrub.onRelease = loader.scrub.onReleaseOutside = function() {
        clearInterval(scrubInterval);
        videoInterval = setInterval(videoStatus,100);
        this.stopDrag();
    };

    function scrubit() {
        bcPlayer.seek(Math.floor((loader.scrub._x/loader.loader_frame._width) * myVideoLength/1000));
    };

    fullscreen_menu.loader2.scrub.onPress = function() {
        clearInterval(videoInterval);
        scrubInterval = setInterval(scrubit2,10);
        this.startDrag(false,0,this._y,fullscreen_menu.loader2.loader_frame._width,this._y);
    };

    fullscreen_menu.loader2.scrub.onRelease = fullscreen_menu.loader2.scrub.onReleaseOutside = function() {
        clearInterval(scrubInterval);
        videoInterval = setInterval(videoStatus,100);
        this.stopDrag();
    };

    function scrubit2() {
        bcPlayer.seek(Math.floor((fullscreen_menu.loader2.scrub._x/fullscreen_menu.loader2.loader_frame._width) * myVideoLength/1000));
    };

// code for scrubber from gotoandlearn.com end

    video_duration.text = fullscreen_menu.video_duration_fullscreen.text = msToTimeString(myCurrentTitle.length);
};

// convert to seconds function start

function msToTimeString(seconds) {
    seconds = int(seconds/1000);
    min = int(seconds/60);
    sec = seconds-min*60;
    sec = sec<10 ? "0"+String(sec) : String(sec);
    min = min<10 ? "0"+String(min) : String(min);
    time = min+":"+sec;
    return time;
};

// convert to seconds function end

// convert to time function start

function convertToTimeString(seconds) {
    if (seconds == undefined) {
        time = "00:00";
    } else {
        seconds = Math.floor(seconds);
        min = int(seconds/60);
        sec = seconds-min*60;
        sec = sec<10 ? "0"+String(sec) : String(sec);
        min = min<10 ? "0"+String(min) : String(min);
        time = min+":"+sec;
    };
	return time;
};

// convert to time function end

// fullscreen start
// check Flash player version for fullscreen button
versarray = getVersion ().split (" ")[1].split (",");
vers = Number (versarray[0] * 1000) + Number (versarray[1] * 100) + Number(versarray[2]);
goodfullscreen = (vers > 9027);
if (goodfullscreen) {
    if (_level0.variable2 == "music") {
        attachMovie("btn_fullscreen_music", "new_fullscreen_button", 8, {_y:291.4, _x:282});;
    } else {
        attachMovie("btn_fullscreen", "new_fullscreen_button", 8, {_y:291.4, _x:282});;
    }
    new_fullscreen_button.image_over._visible = false;
// event listener activates maximimize or minimize function on state change (eg. pressing escape button)
    var EventListener:Object = new Object ();
    EventListener.onFullScreen = function (bFull:Boolean) {
        if (bFull) {
            _root.maximize ();
        } else {
            _root.minimize ();
        };
    };
    Stage.addListener (EventListener);
// fullscreen button.  This toggles between maximize and minimize though only maximize is used here.
    new_fullscreen_button.onPress = function () {
//        this.swapDepths (_root.getNextHighestDepth ());
        if (Stage["displayState"] == "normal") {
            _root.maximize ();
        } else {
            _root.minimize ();
        };
    };
};

// switch to fullscreen function start
function maximize () {
    initial_player_height = bcPlayer._height;
    initial_player_width = bcPlayer._width;
    screen_height = System.capabilities.screenResolutionY;
    screen_width = System.capabilities.screenResolutionX;
// add black background
    _root.attachMovie("stage_cover", "new_stage_cover", 200, {_y:0, _x:0, _height:Stage.height, _width:Stage.width});
    new_stage_cover.useHandCursor = false;
    new_stage_cover.onPress = function() {
        bcPlayer.pauseVideo(true);
    };
// scale and position player according to aspect ratio and size of monitor and video
    if ((initial_player_height / initial_player_width) > (screen_height / screen_width)) {
// black bars down the sides
        Stage["displayState"] = "fullScreen";
        scale_amount = Stage.height / initial_player_height * 100;
// scale video player
        bcPlayer._xscale = scale_amount;
        bcPlayer._yscale = scale_amount;
// position video player
        bcPlayer._x = (Stage.width / 2) - (bcPlayer._width / 2);
        bcPlayer._y = 0;
    } else {
// black bars top and bottom
        Stage["displayState"] = "fullScreen";
        scale_amount = Stage.width / initial_player_width * 100;
// scale video player
        bcPlayer._xscale = scale_amount;
        bcPlayer._yscale = scale_amount;
// position video player
        bcPlayer._x = 0;
        bcPlayer._y = ((Stage.height / 2) - (bcPlayer._height / 2));
    };
// place video player on top of black background
    bcPlayer.swapDepths(201);
    Mouse.hide();
};
// switch to fullscreen function end

// rollover for fullscreen button start
new_fullscreen_button.onRollOver = function() {
    new_fullscreen_button.image_over._visible = true;
};

new_fullscreen_button.onRollOut = new_fullscreen_button.onReleaseOutside = function() {
    new_fullscreen_button.image_over._visible = false;
};
// rollover for fullscreen button end

// switch to normal screen function start
function minimize () {
    Stage["displayState"] = "normal";
// position video player
    bcPlayer._x = 0;
    bcPlayer._y = 0;
// scale video player
    bcPlayer._xscale = 100;
    bcPlayer._yscale = 100;
    _root.new_stage_cover.removeMovieClip();
};
// switch to normal screen function end

var mouseListener:Object = new Object();
mouseListener.onMouseMove = function():Void {
    if (Stage["displayState"] == "fullScreen" and fullscreen_menu_var == false) {
//        _root.attachMovie("fullscreen_menu", "new_fullscreen_menu", 202, {_y:System.capabilities.screenResolutionY - 50, _x:System.capabilities.screenResolutionX / 2 - 255, _alpha:0});
        fullscreen_menu._y = System.capabilities.screenResolutionY - 50;
        fullscreen_menu._x = System.capabilities.screenResolutionX / 2 - 255;
        Mouse.show();
        fullscreen_menu.onEnterFrame = function () {
            if (this._alpha<100) {   
                this._alpha += 10;
            } else {
                delete this.onEnterFrame;
            };
        };
        fullscreen_menu_var = true;
    };
};
Mouse.addListener(mouseListener);

fullscreen_menu.button_fullscreen.onPress = function () {
    _root.minimize ();
};
// fullscreen end

// buffering function start
function onBuffering() {
    now_buffering._visible = true;
}
// buffering function end
