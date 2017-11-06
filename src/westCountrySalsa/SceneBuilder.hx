package westCountrySalsa;
import kScenes.ImageWrapper;
import kScenes.TextWrapper;
import kScenes.SceneDirector;
import kha.graphics2.Graphics;
import kha.Color;
import kScenes.Scene;
import kha.math.FastMatrix3;
import kScenes.MultiTextImage;
import kScenes.Wrapper;
import kha.Assets;
class SceneBuilder {
		public static var red1: Int = 0xeeC61E13;
	public static var red3: Int = 0xaaC61E13;
	public static var red2: Int = 0xeeDC332E;
	var director: SceneDirector;
	public function new( director_: SceneDirector ){
		director = director_;
		director.enableKeyControl();
	}
	function add( scene: Scene ){
		director.add( scene );
	} 
	public function home(){
		var scene = new Scene( 'home' );
		scene.addImage( new ImageWrapper( Assets.images.westCountryHome ));
		var black = 0xee000000;
		var white = 0xd0ffffff;
		var bottomTextHeader =38 - 5;
		var bottomTextBody = 32 - 8;
		var py = 607 + 2;
		var dy = 33;
		var px = 27;

		var tx = new TextWrapper( "Classes", Assets.fonts.Arimo_Regular, red1, bottomTextHeader, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 17 - 2 ;
		var txArr = new Array<TextWrapper>();
		tx = new TextWrapper( "Salsa classes starting Thursday 16th November", Assets.fonts.Arimo_Regular, black, bottomTextBody, 2, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "Beginners from 7.30pm, social dancing till late.", Assets.fonts.Arimo_Regular, black, bottomTextBody, 2, 27, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "At the Rose & Crown, BA2 7SN", Assets.fonts.Arimo_Regular, black, bottomTextBody, 2, 27, py, false );
		txArr[ txArr.length ] = tx;
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.WEST_SMALL;
		scene.addImage( multiTx );
		py = 357;
		dy = 37 - 15;
		px = 27;
		var middle0 = 30 - 12;
		var middle1 = 35 - 14;
		var dull = 0x80000000;//0x44000000;
		var tx = new TextWrapper( "beginners salsa lessons in:", Assets.fonts.Arimo_Bold, dull, middle0, 1, px, py );
		tx.offSide = Compass.NORTH_SMALL;
		scene.addText( tx );
		py += dy + 1;
		var tx = new TextWrapper( "Cross Body, Cuban, Cali", Assets.fonts.Arimo_Bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 20-10;
		tx = new TextWrapper( "social music:", Assets.fonts.Arimo_Bold, dull, middle0, 1, px, py );
		tx.offSide = Compass.NORTH_SMALL;
		scene.addText( tx );
		py += dy + 1;
		tx = new TextWrapper( "Salsa, Bachata, Forro", Assets.fonts.Arimo_Bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 1;
		tx = new TextWrapper( "Cumbia, Kizomba", Assets.fonts.Arimo_Bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );

		var white = 0x99ffffff;
		px = 1024 - 340;
		py = 768 - 97;
		tx = new TextWrapper( "contact:", Assets.fonts.Arimo_Bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_EAST_SMALL;
		scene.addText( tx );
		py += dy;
		tx = new TextWrapper( 'westcountrysalsa@gmail.com', Assets.fonts.Arimo_Bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.EAST_SMALL;
		scene.addText( tx );

		addTitle( scene, red1, red2 );
		addMenu( scene );
		addCopyRight( scene, red3 );
		add( scene );
		return scene;
	}
	public function venue(){
		var scene = new Scene( 'venue' );
		var img = new ImageWrapper( Assets.images.RoseAndCrown, 600, 250 );
		img.offSide = EAST_SMALL;
		scene.addImage( img );
		addTitle( scene, Color.White, Color.White );
		var py = 608.6;
		var dy = 37;
		var px = 27.6;
		var white = 0xd0ffffff;
		var black = 0xda000000;
		var txArr = new Array<TextWrapper>();

		py = 608;
		dy = 37;
		px = 27;
		var tx = new TextWrapper( "Rose & Crown, Public House", Assets.fonts.Arimo_Regular, Color.White, 38, 2, px, py, false );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		
		py += dy + 2;
		tx = new TextWrapper( "Hinton Charterhouse", Assets.fonts.Arimo_Regular, white, 33, 2, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "BATH", Assets.fonts.Arimo_Regular, white, 33, 2, 27, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "BA2 7SN", Assets.fonts.Arimo_Regular, white, 33, 2, 27, py, false );
		txArr[ txArr.length ] = tx;
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.WEST_SMALL;
		scene.addImage( multiTx );

		//addMenu( scene );
		addCopyRight( scene, red3 );
		add( scene );
		return scene;
	}

	public static function addCopyRight( scene: Scene, col0: Int ){
		var py = 768 - 33 - 2;
		var px = 1024 - 232 - 15 + 8;
		var tx = new TextWrapper( "© 2017 West Country Salsa", Assets.fonts.Arimo_Bold, col0, 17, 1, px, py );
		tx.offSide = SOUTH;
		scene.addText( tx );
	}
	public function teachers(){
		var scene = new Scene( 'Teachers' );
		scene.addImage( new ImageWrapper( Assets.images.westCountrySalsaPlain ) );
		add( scene );
		addTitle( scene, red1, red2 );
		return scene;
	}
	public static function addTitle( scene: Scene, col0: Int, col1: Int ){
		var tx = new TextWrapper( "West Country", Assets.fonts.Arimo_Regular, col0, 95 - 6, 2, 27, 12+2, false );
		scene.addText( tx );
		tx = new TextWrapper( "SALSA", Assets.fonts.Arimo_Bold, col1, 118 - 6, -3., 343, 100, false );
		tx.hasMatrix = true;
		scene.addText( tx );
	}
	public static function addMenu( scene: Scene ){
		var tx: TextWrapper;
		var px = 1024 - 169;
		var py = 22;
		var dy = 42;
		var white = 0x5affffff;
		var black = 0x66000000;
		var txArr = new Array<TextWrapper>();
		tx = new TextWrapper( "location", Assets.fonts.Arimo_Regular, black, 38, -1.6, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "teachers", Assets.fonts.Arimo_Regular, black, 38, -1.6, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( "contact", Assets.fonts.Arimo_Regular, black, 38, -1.6, px, py, false );
		txArr[ txArr.length ] = tx;
		px = 1024 - 169 + 137;
		py = 22;
		dy = 42;
		white = 0x66ffffff;
		tx = new TextWrapper( ">", Assets.fonts.Arimo_Bold, black, 40, null, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( ">", Assets.fonts.Arimo_Bold, black, 40, null, px, py, false );
		txArr[ txArr.length ] = tx;
		py += dy;
		tx = new TextWrapper( ">", Assets.fonts.Arimo_Bold, black, 40, null, px, py, false );
		txArr[ txArr.length ] = tx;
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.EAST;
		scene.addImage( multiTx );

	}
}
