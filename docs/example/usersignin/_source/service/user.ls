"use strict"

_        = @[\_]
$        = @[\jQuery] || @[\Zepto]

@N = @ndoo ||= {}
_n = @ndoo

_vars    = _n.vars
_func    = _n.func
_stor    = _n.storage

class userService
  (userState) ->
    if not userState
      userState = do
        isSign: false
        userName: ''
    @set userState

  set: (set) ->
    _.extend @, set

  get: (key) ->
    if _.has @, key
      this[key]
    else
      undefined

  signout: ->
    @set isSign: false, userName: ''
    _n.trigger 'STATUS:APP_USER_SIGNOUT'

  auth: (id, password) ->
    if id is \user and password is \123456
      @set do
        isSign: true
        userName: id
      _n.trigger 'STATUS:APP_USER_SIGNIN'
      return true

    false

  hasSignin: ->
    @isSign


_n.service \user,
  creator: userService
  init: ->
    unless @instance
      @instance = new @creator()
    @instance
