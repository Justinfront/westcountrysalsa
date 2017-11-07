package;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Assets;
import kScenes.SceneDirector;
import westCountrySalsa.SceneBuilder;
import kScenes.Scene;
class MainKha {
    var sceneDirector:      SceneDirector;
    var sceneBuilder:       SceneBuilder;
    public function new() {
        Assets.loadEverything(loadAll);
    }
    var start: Scene;
    var venue: Scene;
    var teachers: Scene;
    var pictures: Scene;
    function loadAll(){
        sceneDirector = new SceneDirector();
        sceneBuilder = new SceneBuilder( sceneDirector );
        start       = sceneBuilder.home();
        venue       = sceneBuilder.venue(); 
        teachers    = sceneBuilder.teachers();
        pictures    = sceneBuilder.pictures();
        sceneDirector.buttonPress = changeScene;
        start.show();
        System.notifyOnRender(render);
        Scheduler.addTimeTask(update, 0, 1 / 60);
    }
    function changeScene( scene: Scene, id: Int ){
        switch( id ){
            case 0: 
                sceneDirector.gotoScene( start );
            case 1:
                sceneDirector.gotoScene( venue );
            case 2: 
                sceneDirector.gotoScene( teachers );
            case 3:
                sceneDirector.gotoScene( pictures );
        }
    }
    function update(): Void {
        if( sceneDirector.currentScene() == pictures ){
            sceneBuilder.updateScroller();
        }
    }
    function render(framebuffer: Framebuffer): Void {
        var g2 = framebuffer.g2;
        g2.begin();
        g2.clear(Color.fromValue(0xff000000));
        sceneDirector.render( g2 );
        g2.end();
    }
}