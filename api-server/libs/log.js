var winston = require('winston');

function getLogger(module) {
    var path = module.filename.split('/').slice(-2).join('/');

    var traceCaller = function(n) {
        if( isNaN(n) || n<0) n=1;
        n+=1;
        var s = (new Error()).stack
          , a=s.indexOf('\n',5);
        while(n--) {
          a=s.indexOf('\n',a+1);
          if( a<0 ) { a=s.lastIndexOf('\n',s.length); break;}
        }
        b=s.indexOf('\n',a+1); if( b<0 ) b=s.length;
        a=Math.max(s.lastIndexOf(' ',b), s.lastIndexOf('/',b));
        b=s.lastIndexOf(':',b);
        s=s.substring(a+1,b);
        return s;
      };

    var log = new winston.Logger({
        transports : [
            new winston.transports.Console({
                colorize:   true,
                prettyPrint: true,
                level:      'debug',
                label:      path
            })
        ]
    });

    for (var func in winston.levels) {
      var oldFunc = log[func];

      log[func] = function() {
        var args = Array.prototype.slice.call(arguments);
        args.unshift(traceCaller(1));
        oldFunc.apply(log, args);
      }
    }

    return log;
}

module.exports = getLogger;