const commandLineUsage = require('command-line-usage');
const commandLineArgs = require('command-line-args');

function parseOptions() {
  const sections = [
    {
      header : 'Clockapp CLI',
      content : 'Command line interface to interact with the clockin app.'  
    },
    {
      header: 'Options',
      optionList : [
        {
          name : 'help',
          type: Boolean,
          description : 'Print this help page.',
          alias: 'h'
        },
        {
          name : 'scene',
          type: String,
          description : 'Scene number to activate.',
          alias: 's'
        },
        {
          name : 'address',
          type: String,
          description : 'OBS ostname, localhost by default',
          alias: 'a',
          defaultValue : '127.0.0.1'
        },
        {
          name : 'port',
          type: String,
          description : 'OBS port, 4444 by default',
          alias: 'p',
          defaultValue : '4444',
          defaultOption: true
        }
      ]
    }
  ];
  
  const options = commandLineArgs(sections[1].optionList);
  
  if ('help' in options) {
    console.log(commandLineUsage(sections));
    process.exit(0);
  }


  return options;
}

module.exports.parseOptions = parseOptions;