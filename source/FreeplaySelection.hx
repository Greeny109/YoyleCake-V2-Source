package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;

//credit to Dangerbites for making me not look like an idiot :) - Greeny109

//lmao - dnagerbitch (i love meth)

class FreeplaySelection extends MusicBeatState
{
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	public static var curCategory:Int = 0;
	var selectedSomethin:Bool = false;
	public static var freeSelect:Array<String> = ['story', 'objects', 'parodies', 'extra'];
	
	var arrow:FlxSprite;
	var bg = new FlxSprite(2328,1000).loadGraphic(Paths.image('freeplayselection/Categories'));
	var categories:FlxSprite;
    var story:FlxSprite;
    var objectshows:FlxSprite;
    var parodies:FlxSprite;
	var extra:FlxSprite;
    override function create()
	{

		FlxTransitionableState.skipNextTransIn = true;
    	FlxTransitionableState.skipNextTransOut = true;

		persistentUpdate = persistentDraw = true;

		FlxTween.tween(FlxG.camera, {zoom: 2}, 1.1, {ease: FlxEase.expoInOut});
		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;		

		bg.antialiasing = ClientPrefs.globalAntialiasing;
		bg.scale.x = 0.6;
		bg.scale.y = 0.6;
		bg.screenCenter(); 
		add(bg);

		story = new FlxSprite(8,36).loadGraphic(Paths.image('freeplayselection/StoryMode'));
		story.scale.x = 0.11;
		story.scale.y = 0.11;
		story.x = -70;
		story.y = -410;
      	story.visible = true;
		add(story);

		objectshows = new FlxSprite(8,36).loadGraphic(Paths.image('freeplayselection/ObjectShows'));
		objectshows.scale.x = 0.11;
		objectshows.scale.y = 0.11;
		objectshows.x = 70;
		objectshows.y = -383;
      	objectshows.visible = true;
    	add(objectshows);

		parodies = new FlxSprite(8,36).loadGraphic(Paths.image('freeplayselection/Parodies'));
		parodies.scale.x = 0.11;
		parodies.scale.y = 0.11;
		parodies.x = 210;
		parodies.y = -383;
      	parodies.visible = true;
    	add(parodies);

		extra = new FlxSprite(8,36).loadGraphic(Paths.image('freeplayselection/Extra'));
		extra.scale.x = 0.11;
		extra.scale.y = 0.11;
		extra.x = 350;
		extra.y = -383;
      	extra.visible = true;
    	add(extra);

		arrow = new FlxSprite(8,36).loadGraphic(Paths.image('freeplayselection/thisarrow'));
		arrow.scale.x = 0.1;
		arrow.scale.y = 0.1;
		arrow.x = 173;
		arrow.y = 250;
      	arrow.visible = true;
		add(arrow);
		changeSelection();
		super.create();

	};
	var curSelected:Int = 0;
    var canInput:Bool = false;
	override public function update(elapsed:Float)
	{
		if (controls.UI_LEFT_P) 
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			trace(curSelected);
			if (curSelected > 0) {
				arrow.x-= 140;
				curSelected--;
			}
			updateSelectorLmao();
		}
		if (controls.UI_RIGHT_P) 
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			trace(curSelected);
			if (curSelected < 3) {
				arrow.x += 140;
				curSelected++;
			}
			updateSelectorLmao();
		}

		if (controls.BACK) 
		{
			selectedSomethin = true;
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		

        if (controls.ACCEPT)
		{
			selectedSomethin = true;
			selected();
        }

        curCategory = curSelected;

        super.update(elapsed);
    }

	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeSelect.length - 3;
		if (curSelected >= freeSelect.length)
			curSelected = 0;

		var bullShit:Int = 0;

}

	public function updateSelectorLmao() { //this took me like 30 mins lmao - dangerbitch
		var secondz:Float = 0.2;

		if (curSelected == 0) {
			FlxTween.tween(story, {y: -410}, secondz, {ease: FlxEase.expoOut});
		} else {
			FlxTween.tween(story, {y: -383}, secondz, {ease: FlxEase.expoOut});
		}

		if (curSelected == 1) {
			FlxTween.tween(objectshows, {y: -410}, secondz, {ease: FlxEase.expoOut});
		} else {
			FlxTween.tween(objectshows, {y: -383}, secondz, {ease: FlxEase.expoOut});
		}

		if (curSelected == 2) {
			FlxTween.tween(parodies, {y: -410}, secondz, {ease: FlxEase.expoOut});
		} else {
			FlxTween.tween(parodies, {y: -383}, secondz, {ease: FlxEase.expoOut});
		}

		if (curSelected == 3) {
			FlxTween.tween(extra, {y: -410}, secondz, {ease: FlxEase.expoOut});
		} else {
			FlxTween.tween(extra, {y: -383}, secondz, {ease: FlxEase.expoOut});
		}

	}

	public function selected()
		{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				story.loadGraphic(Paths.image('freeplayselection/StoryMode'));
				objectshows.loadGraphic(Paths.image('freeplayselection/ObjectShows'));
				parodies.loadGraphic(Paths.image('freeplayselection/Parodies'));
				extra.loadGraphic(Paths.image('freeplayselection/Extra'));
	
				FlxG.camera.flash(FlxColor.WHITE, 0.3);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
			{
				MusicBeatState.switchState(new FreeplayState());
			});
		}
}