/*
" --------------------------------------------------
"   FileName: ndoo_service.ls
"       Desc: ndoo.js service模块
"             借鉴了t3.js http://t3js.org/
"     Author: chenglf
"    Version: ndoo.js(v1.0b1)
" LastChange: 11/03/2015 21:12
" --------------------------------------------------
*/
(function(){
  "use strict";
  var _, $, _n, _vars, _func, _stor;
  _ = this['_'];
  $ = this['jQuery'] || this['Zepto'];
  this.N = this.ndoo || (this.ndoo = {});
  _n = this.ndoo;
  _vars = _n.vars;
  _func = _n.func;
  _stor = _n.storage;
  _n.service = function(namespace, creator){
    var nsmatch, name, ref$, service;
    if (nsmatch = namespace.match(/(.*?)(?:[/.]([^/.]+))$/)) {
      namespace = nsmatch[1], name = nsmatch[2];
    } else {
      ref$ = ['_default', name], namespace = ref$[0], name = ref$[1];
    }
    if (creator) {
      return _n._block('service', namespace, name, {
        creator: creator,
        instance: null
      });
    } else {
      service = _n._block('service', namespace, name);
      if (!service.instance) {
        service.instance = new service.creator(_n);
      }
      return service.instance;
    }
  };
  _n.trigger('STATUS:NSERVICE_DEFINE');
}).call(this);