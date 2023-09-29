package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;
	var selector:Float = 1;
	var shouldTween:Bool = true;

	var mations:FlxSprite;
	var bryin:FlxSprite;
	var ethan:FlxSprite;
	var crispy:FlxSprite;
	var greeny:FlxSprite;
	var jelly:FlxSprite;
	var gabi:FlxSprite;
	var sebota:FlxSprite;
	var bendy:FlxSprite;
	var danger:FlxSprite;
	var bookey:FlxSprite;
	var salty:FlxSprite;
	var max:FlxSprite;
	var haynster:FlxSprite;
	var doret:FlxSprite;
	var patzi:FlxSprite;
	var goldie:FlxSprite;
	var skye:FlxSprite;
	var craftedpin:FlxSprite;
	var toppz:FlxSprite;
	var skrello:FlxSprite;
	var luka:FlxSprite;
	var volt:FlxSprite;
	var cash:FlxSprite;
	var caster:FlxSprite;
	var galaxybeam:FlxSprite;
	var andrewfella:FlxSprite;
	var dragomon:FlxSprite;
	var winners:FlxSprite;





	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('creditsBG'));
		add(bg);
		bg.screenCenter();
		bg.scale.x = 0.27;
		bg.scale.y = 0.27;

		bryin = new FlxSprite().loadGraphic(Paths.image('YCredits/bryin'));
		bryin.x = 420;
		bryin.y = 58;
		add(bryin);

		mations = new FlxSprite().loadGraphic(Paths.image('YCredits/mations'));
		mations.x = 870;
		mations.y = 97;
		add(mations);

		ethan = new FlxSprite().loadGraphic(Paths.image('YCredits/ethan'));
		ethan.x = 1300;
		ethan.y = 100;
		add(ethan);

		crispy = new FlxSprite().loadGraphic(Paths.image('YCredits/crispy'));
		crispy.x = 1790;
		crispy.y = 19;
		add(crispy);

		greeny = new FlxSprite().loadGraphic(Paths.image('YCredits/greeny'));
		greeny.x = 2275;
		greeny.y = 284;
		add(greeny);

		jelly = new FlxSprite().loadGraphic(Paths.image('YCredits/jelly'));
		jelly.x = 2650;
		jelly.y = -55;
		add(jelly);

		gabi = new FlxSprite().loadGraphic(Paths.image('YCredits/gabi'));
		gabi.x = 3080;
		gabi.y = 25;
		add(gabi);

		sebota = new FlxSprite().loadGraphic(Paths.image('YCredits/sebota'));
		sebota.x = 3500;
		sebota.y = -15;
		add(sebota);

		bendy = new FlxSprite().loadGraphic(Paths.image('YCredits/bendy'));
		bendy.x = 3970;
		bendy.y = 77;
		add(bendy);

		danger = new FlxSprite().loadGraphic(Paths.image('YCredits/danger'));
		danger.x = 4370;
		danger.y = 126;
		add(danger);

		bookey = new FlxSprite().loadGraphic(Paths.image('YCredits/bookey'));
		bookey.x = 4880;
		bookey.y = 115;
		add(bookey);

		salty = new FlxSprite().loadGraphic(Paths.image('YCredits/salty'));
		salty.x = 5280;
		salty.y = 34;
		add(salty);

		max = new FlxSprite().loadGraphic(Paths.image('YCredits/maxxx'));
		max.x = 5760;
		max.y = 28;
		add(max);

		haynster = new FlxSprite().loadGraphic(Paths.image('YCredits/haynster'));
		haynster.x = 6170;
		haynster.y = 103;
		add(haynster);
		
		doret = new FlxSprite().loadGraphic(Paths.image('YCredits/doret'));
		doret.x = 6640;
		doret.y = -47;
		add(doret);

		patzi = new FlxSprite().loadGraphic(Paths.image('YCredits/patzi'));
		patzi.x = 7090;
		patzi.y = -73;
		add(patzi);

		goldie = new FlxSprite().loadGraphic(Paths.image('YCredits/goldie'));
		goldie.x = 7480;
		goldie.y = 33;
		add(goldie);

		skye = new FlxSprite().loadGraphic(Paths.image('YCredits/skye'));
		skye.x = 7960;
		skye.y = 240;
		add(skye);

		craftedpin = new FlxSprite().loadGraphic(Paths.image('YCredits/crafted'));
		craftedpin.x = 8400;
		craftedpin.y = 45;
		add(craftedpin);

		toppz = new FlxSprite().loadGraphic(Paths.image('YCredits/toppz'));
		toppz.x = 8800;
		toppz.y = 20;
		add(toppz);

		skrello = new FlxSprite().loadGraphic(Paths.image('YCredits/skrello'));
		skrello.x = 9240;
		skrello.y = 23;
		add(skrello);

		luka = new FlxSprite().loadGraphic(Paths.image('YCredits/luka'));
		luka.x = 9730;
		luka.y = 10;
		luka.scale.x = 0.85;
		luka.scale.y = 0.85;
		add(luka);

		volt = new FlxSprite().loadGraphic(Paths.image('YCredits/volt'));
		volt.x = 10170;
		volt.y = 63;
		add(volt);

		cash = new FlxSprite().loadGraphic(Paths.image('YCredits/cash'));
		cash.x = 10570;
		cash.y = -57;
		add(cash);

		caster = new FlxSprite().loadGraphic(Paths.image('YCredits/caster'));
		caster.x = 10990;
		caster.y = 116;
		add(caster);

		galaxybeam = new FlxSprite().loadGraphic(Paths.image('YCredits/galaxy'));
		galaxybeam.x = 11430;
		galaxybeam.y = 130;
		add(galaxybeam);

		andrewfella = new FlxSprite().loadGraphic(Paths.image('YCredits/andrew'));
		andrewfella.x = 11890;
		andrewfella.y = 85;
		add(andrewfella);

		dragomon = new FlxSprite().loadGraphic(Paths.image('YCredits/dragomon'));
		dragomon.x = 12340;
		dragomon.y = 100;
		add(dragomon);

		winners = new FlxSprite().loadGraphic(Paths.image('YCredits/winners'));
		winners.x = 12180;
		winners.y = 20;
		winners.scale.x = 0.85;
		winners.scale.y = 0.85;
		add(winners);





		
		grpOptions = new FlxTypedGroup<Alphabet>();
		//add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Psych Engine Team'],
			['Bryin64',				'shubs',			'Ex Lead Director and Artist',						'https://youtube.com/@Brain64',			'00FFFFFF'],
			['mationsBOMB!1!',		'shadowmario',		'Ex Director, Artist and Composer',								'https://youtube.com/@MationsBomb',	'00FFFFFF'],
			['EthanAwoke',				'kade',				'Ex Director, Chromatic Maker and Animator',			'https://youtube.com/@EthanAwoke',			'00FFFFFF'],
			['CrispyNugget',		'mastereric',		'Lead Director, Composer and Artist',										'https://youtube.com/@CrispyNugget',	'00FFFFFF'],
			['Greeny109',		'proxy',			'Director, Charter, Playtester, Animator, Composer, and Coder',							'https://www.youtube.com/channel/UCsLjq-npRyNOEtC1rqFWh7Q',	'00FFFFFF'],
			['jelly!',				'flicky',			'Animator and Artist',		'https://youtube.com/@jelly07',			'00FFFFFF'],
			['TheGabiM',			'sqirra',			'Lead Composer, Charter, Artist, Chromatic Maker and Lua Script Coder',	'https://www.youtube.com/@simplementegabi',			'00FFFFFF'],
			['Sebota',			'river',			'Animator and Artist',							'https://www.youtube.com/@Sebota',		'00FFFFFF'],
			['superbendy',				'keoiki',			'Charter, Idea Maker, Coder, Artist, Idea Maker',										'https://www.youtube.com/channel/UCdE8fPiuG4hnIwyx_KHCQNg',			'00FFFFFF'],
			['DangerBites',			'bb',				'Coder, Composer and Chromatic Maker',								'https://youtube.com/@Dangerbites',			'00FFFFFF'],
			['bookey',	'nebula',			'Playtester',							'https://trycatchingup.carrd.co/',		'00FFFFFF'],
			['salty girl',				'smokey',			'Composer',											'https://www.youtube.com/channel/UCI3o3qyXN1es68tJHeoG0yA',		'00FFFFFF'],
			['max',		'ninjamuffin99',	"Artist, Concept Maker",							'https://twitter.com/maxthefoxoffic1?s=21&t=-unYatP3D9gsLd2u6LiXow',	'00FFFFFF'],
			['haynster',		'credit0',	"Semi-Coder",								'https://www.youtube.com/channel/@Haynster',	'00FFFFFF'],
			['doret',		'phantomarcade',	"Composer",								'https://www.youtube.com/channel/UCvQxZHt4JE-OmzZCqNjtp6Q',	'00FFFFFF'],
			['patzi',		'credit1',	"Artist and Chromatic Maker",								'https://www.youtube.com/channel/UC7lFEkQOJ6Kqnmx4wD9ThTg',	'00FFFFFF'],
			['goldie',		'credit2',	"Artist",								'https://www.youtube.com/@goldies_animations2596',	'00FFFFFF'],
			['cloudyskyes',		'kawaisprite',	"Charter and Coder",								'https://www.youtube.com/@cloudyskyes',	'00FFFFFF'],
			['CraftedPin',		'evilsk8r',	"Charter",								'https://youtube.com/@CraftedPin',	'00FFFFFF'],
			['Toppz',		'credit3',	"Minor Composer, Chromatic Maker, Minor Artist",								'https://www.youtube.com/channel/UCjkrOYgWLb5ifVNwxsyAp5A',	'00FFFFFF'],
			['Skrello',		'credit4',	"Artist",								'https://www.youtube.com/@skrellostudios7275',	'00FFFFFF'],
			['luka',		'credit5',	"Composer and Chromatic Maker",								'https://www.youtube.com/@lukaspatula1212',	'00FFFFFF'],
			['volt',		'credit6',	"Artist, Composer, Charter and Chromatic Maker",								'https://www.youtube.com/@ladvolty',	'00FFFFFF'],
			['cash',		'credit6',	"Artist",								'hhttps://www.youtube.com/@ca8h146',	'00FFFFFF'],
			['caster',		'credit7',	"Composer and Charter",								'https://www.youtube.com/@caster1k',	'00FFFFFF'],
			['galaxybeam',		'credit8',	"Charter",								'https://www.youtube.com/@galaxybeam',	'00FFFFFF'],
			['andrewfella',		'credit9',	"Composer",								'https://www.youtube.com/channel/UCfZuaNo18MLhOTsdUNJzIeg',	'00FFFFFF'],
			['dragomon',		'credit10',	"Charter",								'https://www.youtube.com/channel/UC4UWpTLQPyX81lehIrADIig',	'00FFFFFF'],
			['winners',		'credit11',	"Loading Screen Winners",								'',	'00FFFFFF']


		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;

			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				//add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		//add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		//add(descText);

		//bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();


		add(descBox);
		add(descText);


		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;
				var rightP = controls.UI_RIGHT_P;
				var leftP = controls.UI_LEFT_P;

				if (leftP)
				{
					/*FlxTween.tween(creditPeople, { x: creditPeople.x + 340}, 0.3, {ease: FlxEase.expoOut});
					changeSelection(-shiftMult);
					holdTime = 0;
					selector--;*/
					if (selector > 1) {
						shouldTween = false;
						FlxTween.tween (bryin, { x: bryin.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween (mations, { x: mations.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(ethan, { x: ethan.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(crispy, { x: crispy.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(greeny, { x: greeny.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(jelly, { x: jelly.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(gabi, { x: gabi.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(sebota, { x: sebota.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(bendy, { x: bendy.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(danger, { x: danger.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(bookey, { x: bookey.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(salty, { x: salty.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});	
						FlxTween.tween (max, { x: max.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween (haynster, { x: haynster.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(doret, { x: doret.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(patzi, { x: patzi.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(goldie, { x: goldie.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(skye, { x: skye.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(craftedpin, { x: craftedpin.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(toppz, { x: toppz.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(skrello, { x: skrello.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(luka, { x: luka.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(volt, { x: volt.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(cash, { x: cash.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(caster, { x: caster.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(galaxybeam, { x: galaxybeam.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(andrewfella, { x: andrewfella.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(dragomon, { x: dragomon.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(winners, { x: winners.x + 440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		

						changeSelection(-shiftMult);
						holdTime = 0;
						selector--;
					}
				}
				if (rightP)
				{
					/*FlxTween.tween(creditPeople, { x: creditPeople.x + -340}, 0.5, {ease: FlxEase.expoOut});
					changeSelection(shiftMult);
					holdTime = 0;
					selector++;*/
					if (selector < 29) {
						shouldTween = false;
						FlxTween.tween (bryin, { x: bryin.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween (mations, { x: mations.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(ethan, { x: ethan.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(crispy, { x: crispy.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(greeny, { x: greeny.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(jelly, { x: jelly.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(gabi, { x: gabi.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(sebota, { x: sebota.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(bendy, { x: bendy.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(danger, { x: danger.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(bookey, { x: bookey.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(salty, { x: salty.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});
						FlxTween.tween (max, { x: max.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween (haynster, { x: haynster.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(doret, { x: doret.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(patzi, { x: patzi.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(goldie, { x: goldie.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(skye, { x: skye.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(craftedpin, { x: craftedpin.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb}); 
						FlxTween.tween(toppz, { x: toppz.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(skrello, { x: skrello.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(luka, { x: luka.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(volt, { x: volt.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(cash, { x: cash.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(caster, { x: caster.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(galaxybeam, { x: galaxybeam.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(andrewfella, { x: andrewfella.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(dragomon, { x: dragomon.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		
						FlxTween.tween(winners, { x: winners.x + -440}, 0.3, {ease: FlxEase.expoOut, onComplete: bolb});		


						changeSelection(shiftMult);
						holdTime = 0;
						selector++;
					}
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}

	function bolb(tween:FlxTween):Void
	{
		shouldTween = true;
	}

}