package;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Assets;
import kScenes.SceneDirector;
import westCountrySalsa.SceneBuilder;
class MainKha {
    var sceneDirector:    SceneDirector;
    var sceneBuilder:       SceneBuilder;
    public function new() {
        Assets.loadEverything(loadAll);
    }
    function loadAll(){
        sceneDirector = new SceneDirector();
        sceneBuilder = new SceneBuilder( sceneDirector );
        var start = sceneBuilder.home();
        sceneBuilder.venue(); 
        sceneBuilder.teachers();
        start.show();
        System.notifyOnRender(render);
        Scheduler.addTimeTask(update, 0, 1 / 60);
    }
    function update(): Void {
        
    }
    function render(framebuffer: Framebuffer): Void {
        var g2 = framebuffer.g2;
        g2.begin();
        g2.clear(Color.fromValue(0xff000000));
        sceneDirector.render( g2 );
        g2.end();
    }
}