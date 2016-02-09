// Generated by LiveScript 1.4.0
(function(){
  "use strict";
  var _, $, _n, _vars, _func, _stor, userService;
  _ = this['_'];
  $ = this['jQuery'] || this['Zepto'];
  this.N = this.ndoo || (this.ndoo = {});
  _n = this.ndoo;
  _vars = _n.vars;
  _func = _n.func;
  _stor = _n.storage;
  userService = (function(){
    userService.displayName = 'userService';
    var prototype = userService.prototype, constructor = userService;
    function userService(userState){
      if (!userState) {
        userState = {
          isSign: false,
          userName: ''
        };
      }
      this.set(userState);
    }
    prototype.set = function(set){
      return _.extend(this, set);
    };
    prototype.get = function(key){
      if (_.has(this, key)) {
        return this[key];
      } else {
        return undefined;
      }
    };
    prototype.signout = function(){
      this.set({
        isSign: false,
        userName: ''
      });
      return _n.trigger('STATUS:APP_USER_SIGNOUT');
    };
    prototype.auth = function(id, password){
      if (id === 'user' && password === '123456') {
        this.set({
          isSign: true,
          userName: id
        });
        _n.trigger('STATUS:APP_USER_SIGNIN');
        return true;
      }
      return false;
    };
    prototype.hasSignin = function(){
      return this.isSign;
    };
    return userService;
  }());
  _n.service('user', {
    creator: userService,
    init: function(){
      if (!this.instance) {
        this.instance = new this.creator();
      }
      return this.instance;
    }
  });
}).call(this);