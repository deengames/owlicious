package deengames.abook.owlicious.elements;

import deengames.abook.core.Element;
import deengames.abook.core.Screen;

class Cloud extends Element
{
    public function new(json:Dynamic)
    {
        super(json);
        this.resetPosition();
        this.x = Math.random() * Main.gameWidth; // Initially, not all at RHS
        
        this.setClickAudio('assets/audio/bubble-pop');
    }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if (this.x <= -this.width) {
            this.resetPosition();
        }
    }
    
    public function resetPosition():Void
    {
        // Pick cloud image
        var num = Math.round(Math.random() * 2) + 1; // 1-2
        this.setImage('assets/images/cloud-${num}');
        
        // respawn on RHS of screen
        this.x = Main.gameWidth;
        // Randomize y
        this.y = Math.random() * (Main.gameHeight - this.height);
        this.velocity.x = -1 * ((Math.random() * 200) + 300); // 200-500
        // Reset if popped
        this.alpha = 1;
        
        // Owl's z is 5, so half clouds are over and half are under
        // 0...10
        this.z = Math.round((Math.random() * 10));        
        Screen.currentScreen.sortElementsByZ();
    }
    
    override public function clickHandler(object:flixel.FlxObject):Void
    {
        super.clickHandler(object);
        this.alpha = 0;
    }
}