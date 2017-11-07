package westCountrySalsa;
import kScenes.ImageWrapper;
import kScenes.TextWrapper;
import kScenes.RectangleWrapper;
import kScenes.SceneDirector;
import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kScenes.Scene;
import kha.math.FastMatrix3;
import kScenes.MultiTextImage;
import kScenes.Wrapper;
import kha.Assets;
import tweenx909.TweenX;
import tweenx909.EaseX;
import kha.Font;
class SceneBuilder {
	public static var red1: 	Int = 0xeeC61E13;
	public static var red3: 	Int = 0xaaC61E13;
	public static var red2: 	Int = 0xeeDC332E;
	public static var white0: 	Int = 0x5affffff;
	public static var white1: 	Int = 0x66ffffff;
	public static var white3:   Int = 0xd0ffffff;
	public static var black0: 	Int = 0x66000000;
	public static var dull: 	Int = 0x80000000;
	public static var regular: 	Font;
	public static var bold: 	Font;
	var director: 				SceneDirector;
	public function new( director_: SceneDirector ){
		director = director_;
		regular = Assets.fonts.Arimo_Regular;
		bold 	= Assets.fonts.Arimo_Bold;
		director.enableKeyControl();
		director.enableMouseInteraction();
	}
	function add( scene: Scene ){
		director.add( scene );
	} 
	public function home(){
		var scene = new Scene( 'home' );
		scene.addImage( new ImageWrapper( Assets.images.westCountryHome ));
		var rect = new RectangleWrapper( 1024, 768, Color.White, 0xd0C68013, 4., 0, 0 );
		scene.addBackRectangle( rect );

		var black = 0xee000000;
		var white = 0xd0ffffff;
		var bottomTextHeader = 33;
		var bottomTextBody = 24;
		var py = 609;
		var dy = 33;
		var px = 27;

		var tx = new TextWrapper( "Classes", regular, red1, bottomTextHeader, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 15;
		var txArr = new Array<TextWrapper>();
		var info = [ 	"Salsa classes starting Thursday 16th November"
					,	"Beginners from 7.30pm, social dancing till late." 
					,	"At the Rose & Crown, BA2 7SN" ];
		for( i in 0...info.length ){
			tx = new TextWrapper( info[ i ], regular, black, bottomTextBody, 2, px, py, false );
			txArr[ txArr.length ] = tx;
			py += dy;
		}
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.WEST_SMALL;
		scene.addImage( multiTx );
		py = 357;
		dy = 23;
		px = 27;
		var middle0 = 18;
		var middle1 = 21;
		var tx = new TextWrapper( "beginners salsa lessons in:", bold, dull, middle0, 1, px, py );
		tx.offSide = Compass.NORTH_SMALL;
		scene.addText( tx );
		py += dy;
		var tx = new TextWrapper( "Cross Body, Cuban, Cali", bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 9;
		tx = new TextWrapper( "social music:", bold, dull, middle0, 1, px, py );
		tx.offSide = Compass.NORTH_SMALL;
		scene.addText( tx );
		py += dy;
		tx = new TextWrapper( "Salsa, Bachata, Forro", bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy;
		tx = new TextWrapper( "Cumbia, Kizomba", bold, dull, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );

		addContact( scene, dull );
		addTitle( scene, red1, red2 );
		addMenu( scene, 0, red1, black0, black0 );
		addCopyRight( scene, red3 );
		add( scene );
		return scene;
	}

	public function venue(){
		var scene = new Scene( 'venue' );
		var borderWid = 1.;
		var px = 600.;
		var py = 250.;
		var img = new ImageWrapper( Assets.images.RoseAndCrown, px, py );
		scene.addImage( img );
		var rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, 0xd01E13CE, 4., px - borderWid, py - borderWid );
		rect.offSide = EAST_SMALL;
		scene.addBackRectangle( rect );
		img.offSide = EAST_SMALL;
		px = 27.* 2.5;
		py = 195.;
		var dy = 100.;
		var dx = 250.;
		img = new ImageWrapper( Assets.images.pubStairsSmall, px, py );
		img.offSide = NORTH_WEST_SMALL;
		rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, red2, 3., px - borderWid, py - borderWid );
		rect.offSide = NORTH_WEST_SMALL;
		scene.addBackRectangle( rect );
		scene.addImage( img );
		py += dy;
		img = new ImageWrapper( Assets.images.upStairsSmall, px + dx, py );	
		img.offSide = NORTH_EAST_SMALL;
		var rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, red2, 3., px + dx - borderWid, py - borderWid );
		rect.offSide = NORTH_EAST_SMALL;
		scene.addBackRectangle( rect );
		scene.addImage( img );
		py += dy;
		img = new ImageWrapper( Assets.images.pubInsideSmall, px, py );
		img.offSide = SOUTH_WEST_SMALL;
		var rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, red2, 3., px - borderWid, py - borderWid );
		rect.offSide = SOUTH_WEST_SMALL;
		scene.addBackRectangle( rect );
		scene.addImage( img );

		addTitle( scene, Color.White, Color.White );
		addRoseAndCrownAddress( scene, Color.White, white3 );
		addMenu( scene, 1, red1, white0, white1 );
		addCopyRight( scene, red3 );
		add( scene );
		return scene;
	}
	public static function addContact( scene: Scene, col0: Int ){
		var px = 1024 - 340;
		var py = 768 - 97;
		var dy = 23;
		var middle1 = 21;
		var tx = new TextWrapper( "contact:", bold, col0, middle1, 2, px, py );
		tx.offSide = Compass.NORTH_EAST_SMALL;
		scene.addText( tx );
		py += dy;
		tx = new TextWrapper( 'westcountrysalsa@gmail.com', bold, col0, middle1, 2, px, py );
		tx.offSide = Compass.EAST_SMALL;
		scene.addText( tx );
	}
	public static function addRoseAndCrownAddress( scene: Scene, col0: Int, col1: Int ){
		var py = 608;
		var dy = 37;
		var px = 27;
		var tx = new TextWrapper( "Rose & Crown, Public House", regular, col0, 38, 2, px, py, false );
		tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		py += dy + 2;
		var txArr = new Array<TextWrapper>();
		var address = [ "Hinton Charterhouse", "BATH", "BA2 7SN" ];
		for( i in 0...address.length ){
			tx = new TextWrapper( address[ i ], regular, col1, 33, 2, px, py, false );
			txArr[ txArr.length ] = tx;
			py += dy;
		}
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.WEST_SMALL;
		scene.addImage( multiTx );
	}
	public static function addCopyRight( scene: Scene, col0: Int ){
		var py = 768 - 31;
		var px = 1024 - 255;
		var tx = new TextWrapper( "© 2017 West Country Salsa", bold, col0, 17, 1, px, py );
		tx.offSide = SOUTH;
		scene.addText( tx );
	}
	public function teachers(){
		var black = 0xd0000000;
		var scene = new Scene( 'Teachers' );
		scene.addImage( new ImageWrapper( Assets.images.westCountrySalsaPlain ) );
		var rect = new RectangleWrapper( 1024, 768, Color.White, 0x3313CE1E, 4., 0, 0 );
		scene.addBackRectangle( rect );
		var py = 400.;
		var px = 27.;
		var tx = new TextWrapper( "Cristina", bold, red1, 38, 2, px, py );
		tx.offSide = Compass.SOUTH_WEST_SMALL;
		scene.addText( tx );
		px += tx.width;
		var tx = new TextWrapper( " + ", bold, black, 40, 2, px, py );
		//tx.offSide = Compass.NORTH_WEST_SMALL;
		scene.addText( tx );
		px += tx.width- 6;
		var tx = new TextWrapper( "Justin", bold, red2, 38, 2, px, py );
		tx.offSide = Compass.NORTH_EAST_SMALL;
		scene.addText( tx );
		add( scene );
		addMenu( scene, 2, red1, black0, black0 );
		addTitle( scene, red1, red2 );
		addCopyRight( scene, black );
		return scene;
	}
	public function contact(){
		var scene = new Scene( 'Contact' );
		scene.addImage( new ImageWrapper( Assets.images.westCountrySalsaPlain ) );
		var rect = new RectangleWrapper( 1024, 768, Color.White, 0x66EE13CE, 4., 0, 0 );
		scene.addBackRectangle( rect );
		add( scene );
		addMenu( scene, 3, red1, black0, black0 );
		addTitle( scene, red1, red2 );
		addCopyRight( scene, red3 );
		return scene;
	}
	public function pictures(){
		var scene = new Scene( 'Pictures' );
		var rect = new RectangleWrapper( 1024, 768, Color.White,0x661E13CE , 0., 0, 0 );
		scene.addBackRectangle( rect );
		var rect = new RectangleWrapper( 1024, 768, Color.White, 0xFF000000, 0., 0, 0 );
		scene.addBackRectangle( rect );
		var imgs = [ 	Assets.images.IMG_20171028_134048
					,	Assets.images.IMG_20171028_134103
					,	Assets.images.IMG_20171028_134144
					,	Assets.images.IMG_20171028_134154
					,	Assets.images.IMG_20171028_135319
					,	Assets.images.IMG_20171028_135432
					,	Assets.images.IMG_20171028_135745
					,	Assets.images.IMG_20171028_140755
					,	Assets.images.IMG_20171028_140904
					,	Assets.images.IMG_20171028_141142
					,	Assets.images.IMG_20171029_WA0000
					,	Assets.images.IMG_20171029_WA0012
					,	Assets.images.IMG_20171029_WA0030
					,	Assets.images.IMG_20171029_WA0055 ];

		var cols = [ red2, 0xd01E13CE, 0x66EE13CE, 0xd0C68013, red2, 0xd01E13CE, 0x66EE13CE, 0xd0C68013, red2, 0xd01E13CE, 0x66EE13CE, 0xd0C68013,red2, 0xd01E13CE, 0x66EE13CE, 0xd0C68013 ]; 
		var img: ImageWrapper;
		var px = 27.;
		var py = 300.;
		var dx = 20.;
		var borderWid = 1.;
		var imgWraps = new Array<ImageWrapper>();
		var tempScene = new Scene( 'images' );
		var tempScene2 = new Scene( 'bg' );
		for( i in 0...imgs.length ){
			img = new ImageWrapper( imgs[i], px + dx, py );	
			img.alpha = 1.;
			var rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, cols[i], 3., px + dx - borderWid, py - borderWid );
			rect.alpha = 1.;
			tempScene2.addBackRectangle( rect );
			tempScene.addImage( img );
			imgWraps[ imgWraps.length ] = img;
			px += dx + img.width;
		}
		for( i in 0...imgs.length ){
			img = new ImageWrapper( imgs[i], px + dx, py );	
			img.alpha = 1.;
			var rect = new RectangleWrapper( img.width+borderWid*2, img.height+borderWid*2, Color.White, cols[i], 3., px + dx - borderWid, py - borderWid );
			rect.alpha = 1.;
			tempScene2.addBackRectangle( rect );
			tempScene.addImage( img );
			imgWraps[ imgWraps.length ] = img;
			px += dx + img.width;
		}
		var wideImage = tempScene.renderToImage();
		var wideImageBg = tempScene2.renderToImage();
		scrollImageWrapper = new ImageWrapper( wideImage, 0, 0 );
		scrollRectWrapper = new ImageWrapper( wideImageBg, 0, 0 );

		scene.addImage( scrollRectWrapper );
		scene.addImage( scrollImageWrapper );
		addTitle( scene, Color.White, Color.White );
		addMenu( scene, 3, red1, white0, white1 );
		addCopyRight( scene, Color.White );
		add( scene );
		return scene;
	}
	public var scrollRectWrapper:  ImageWrapper;
	public var scrollImageWrapper: ImageWrapper;
	public static function addTitle( scene: Scene, col0: Int, col1: Int ){
		var tx = new TextWrapper( "West Country", regular, col0, 89, 2, 27, 12+2, false );
		scene.addText( tx );
		tx = new TextWrapper( "SALSA", bold, col1, 112, -3., 343, 100, false );
		tx.hasMatrix = true;
		scene.addText( tx );
	}
	public static function addMenu( scene: Scene, id: Int, colSelect: Int, col0: Int, col1: Int  ){
		var tx0: TextWrapper;
		var tx1: TextWrapper;
		var px0 = 1024 - 169 + 1;
		var px1 = px0 + 137 - 1;
		var py = 22;
		var dy = 42;
		var txArr = new Array<TextWrapper>();
		var rw: RectangleWrapper;
		var buttonNames = [ 'home', 'location', 'teachers', 'pictures' ];
		var count: Int = 0;
		for( name in buttonNames ){
			if( count == id ){
				tx0 = new TextWrapper( name, Assets.fonts.Arimo_Regular, colSelect, 38, -1.6, px0, py, false );
				txArr[ txArr.length ] = tx0;
				rw = new RectangleWrapper( tx0.width + 4, tx0.height + 4, Color.White, red1, 0., px0 - 2, py - 2 );
			} else {
				tx0 = new TextWrapper( name, Assets.fonts.Arimo_Regular, col0, 38, -1.6, px0, py, false );
				txArr[ txArr.length ] = tx0;
				tx1 = new TextWrapper( ">", Assets.fonts.Arimo_Bold, col1, 40, null, px1, py, false );	
				txArr[ txArr.length ] = tx1;
				rw = new RectangleWrapper( ( tx1.x + tx1.width ) - px0 + 4, tx0.height + 4, Color.White, red1, 0., px0 - 2, py - 2 );
			}
			count++;
			rw.hitable = true;
			scene.addHit( rw );
			py += dy;
		}
		var multiTx = new MultiTextImage( txArr );
		multiTx.offSide = Compass.EAST;
		scene.addImage( multiTx );
	}
	var deltaX = 0.;
	public function updateScroller(){
		var imgWrap = scrollImageWrapper;
        if( imgWrap.alpha == 1. ){
			var rectWrap = scrollRectWrapper;
			var step = -2.;
            deltaX += step;
            var newPos = deltaX;
            imgWrap.x = newPos;
        	rectWrap.x = newPos;
            if( imgWrap.x < -imgWrap.width/2 ) {
                deltaX = imgWrap.width + imgWrap.x - step;
                newPos = deltaX;
                imgWrap.x = newPos;
                rectWrap.x = newPos;
            }
        } else {
            deltaX = 0.;
        }
	}
}
