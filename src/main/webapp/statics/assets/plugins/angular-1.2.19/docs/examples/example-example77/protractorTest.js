  it('should show off bindings', function() {
    expect(element(by.css('div[ng-handler="Controller"] span[ng-bind]')).getText())
        .toBe('Max Karl Ernst Ludwig Planck (April 23, 1858 – October 4, 1947)');
  });