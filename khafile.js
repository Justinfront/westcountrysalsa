let project = new Project('MainKha');
project.addSources('src');
project.addAssets('Assets/**');
project.addLibrary('tweenx');
project.addLibrary('kScenes');
project.windowOptions.width = 1024;
project.windowOptions.height = 768;
resolve(project);
