((_n, depend) ->
  _        = depend[\_]
  Backbone = depend[\Backbone]
  $        = depend[\$]

  _vars    = _n.vars
  _func    = _n.func
  _stor    = _n.storage

  /* [common prep] {{{ */
  _n.on 'PAGE_STATUS_DOMPREP, PAGE_RELOAD', !->

    init_tpl = ->
      $code = $ \#tplCode
      if $code.length
        text = $code.get(0).text
        if text.replace(/^\s*$/g, '') isnt ''
          try
            $(text).appendTo \body
          catch e
            return false
      true
    /* init template */
  /* }}} */

  /* [home module] {{{ */
  _n.app \example,
    before:
      * filter: \test
        only: \main
      * filter: \test2
        only: \main

    after:
      filter: \afterTest
      only: \main

    testFilter: !->
      console.log \filter_before!

    test2Filter: !->
      console.log \test2Filter!

    afterTestFilter: !->
      console.log \filter_after!

    mainDepend: ['jquery']
    mainAction: (param) !->
      console.log param
      _n.require ['jquery-1.11.1.js', 'jquery-mytest.js'], (a) !->
        a('body').mytest!;
      , \seajs
  /* }}} */
  /* [ndoo module] {{{ */
  _n.app \ndoo.test, do
    mainAction: (param) !->
      console.log \ndoo.test.main
  /* }}} */

  _n
)(@N = @ndoo ||= {}, _: _, $: jQuery)

# vim: se ts=2 sts=2 sw=2 fdm=marker cc=80 et:
