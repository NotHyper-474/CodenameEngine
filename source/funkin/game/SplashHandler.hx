package funkin.game;

import flixel.group.FlxGroup.FlxTypedGroup;

class SplashHandler extends FlxTypedGroup<FunkinSprite> {
    /**
     * Map containing all of the splashes group.
     */
    public var grpMap:Map<String, SplashGroup> = [];

    public function new() {
        super();
    }

    /**
     * Returns a group of splashes, and creates it if it doesn't exist.
     * @param path Path to the splashes XML (`Paths.xml('splashes/splash')`)
     */
    public function getSplashGroup(name:String) {
        if (!grpMap.exists(name)) {
            var grp = new SplashGroup(Paths.xml('splashes/$name'));
            grpMap.set(name, grp);
        }
        return grpMap.get(name);
    }

    public override function destroy() {
        super.destroy();
        for(grp in grpMap)
            grp.destroy();
        grpMap = null;
    }

    public function showSplash(name:String, strum:Strum) {
        var grp = getSplashGroup(name);
        add(grp.showOnStrum(strum));

        // max 8 rendered splashes
        while(members.length > 8)
            remove(members[0]);
    }
}