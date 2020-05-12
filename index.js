const options = require('./options').parseOptions();
const OBSWebSocket = require('obs-websocket-js');


async function main() {
  const obs = new OBSWebSocket();

  obs.on('SwitchScenes', data => {
    console.log(`New Active Scene: ${data.sceneName}`);
  });
  obs.on('error', err => {
      console.error('socket error:', err);
  });  

  await obs.connect({
    address: options.address + ':' + options.port,
    password: ''
  });
  let sceneList = await obs.send('GetSceneList');
  
  if (options.scene !== undefined  && options.scene >= 0 && options.scene < sceneList.scenes.length) {
    await obs.send('SetCurrentScene', { 'scene-name' : sceneList.scenes[options.scene].name})
  }
  obs.disconnect();
}

main();
