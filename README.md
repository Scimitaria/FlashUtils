# FlashUtils
When Flash died, a lot of functionality went with it. These are reimplementations of some of those features.

---

## imgSprite
imgSprite takes a path to an image and constructs a Sprite with it.  

Example usage:
```actionscript
    var s:imgSprite = new imgSprite("public/button.png");
    s.buttonMode = true;
    s.addEventListener(MouseEvent.CLICK, clickButton);
    function clickButton(event:MouseEvent):void{trace("click");}
    addChildAt(s,0);
```

---

## movie
movie is essentially a re-implementation of MovieClip with some added functionality.

Example usage:
```actionscript
    explode = new movie(
        "../public/explosion/1.png",
        "../public/explosion/2.png",
        "../public/explosion/3.png",
        "../public/explosion/4.png"
        );
    addChild(explode);
```

#### features:
- variable-length constructor can take Sprite instances or strings, the latter of which being turned into imgSprites.
- stop, start, gotoAndStop, and gotoAndStart make their return from MovieClip
- addFrame and deleteFrame bring versatile runtime frame editing
