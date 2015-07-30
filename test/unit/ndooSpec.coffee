describe 'ndoo framework test >', ->
  describe 'storage test >', ->
    _stor = undefined

    beforeAll ->
      _stor = ndoo.storage

    it 'ndoo.storage should deinfe', ->
      expect(_stor).toBeDefined()

    it 'get abc, should be undefined', ->
      expect(_stor('abc')).toBeUndefined()

    describe 'set value >', ->
      it 'set abc to 123, should be 123', ->
        expect(_stor('abc', 123)).toBe 123

      it 'get abc after set, should be 123 ', ->
        expect(_stor('abc')).toBe 123

    describe 'rewrite >', ->
      it 'rewrite abc without option, should be false', ->
        expect(_stor('abc', 456)).toBe false
      it 'get abc after rewrite, should be 123', ->
        expect(_stor('abc')).toBe 123

      it 'rewrite abc add option, should be Truthy', ->
        expect(_stor 'abc', 456, _stor.REWRITE).toBeTruthy()
      it 'get abc after rewrite, should be 456', ->
        expect(_stor('abc')).toBe 456

    describe 'destroy >', ->
      it 'remove abc for storage, should be true', ->
        expect(_stor('abc', null, _stor.DESTROY)).toBe true

      it 'get abc for storage, should be undefined', ->
        expect(_stor('abc')).toBeUndefined()

  describe 'block test >', ->
    _n = undefined
    beforeAll ->
      _n = ndoo

    it 'has block shoud false', ->
      expect(_n.hasBlock 'test').toBeUndefined()

    it 'get block should false', ->
      expect(_n.block 'test').toBe false

    # describe 'main block >', ->
    #
    #   describe 'ui.checkinDate >', ->
    #     uiCheckinDate = undefined
    #     beforeAll ->
    #       uiCheckinDate = _n.block 'ui.checkinDate'
    #
    #     it 'has uiCheckinDate', ->
    #       expect(uiCheckinDate).toBeTruthy()
    #
    #     it 'test convertDate', ->
    #       date = new Date(2015, 6, 22)
    #       convDateTime = uiCheckinDate.convertDate('2015-07-22').getTime()
    #       expect(convDateTime).toBe date.getTime()
    #
    #     it 'test dateAddDay', ->
    #       date = new Date(2015, 6, 27)
    #       date2Time = uiCheckinDate.dateAddDay('2015-07-22', 5).getTime()
    #       expect(date2Time).toBe date.getTime()