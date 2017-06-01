var s,
CarriageTypesVisibilityWidget = {

  settings: {
    type_selector: '#carriage_type',
    carr_inputs: '.types-inputs'
  },

  init: function() {
    s = this.settings;
    this.showHideInputs();
    this.bindUIActions();
  },

  showHideInputs: function() {
    var inputs = $(s.carr_inputs);
    console.log(inputs)
    var type = $(s.type_selector);
    var value = this._toUnderscore(type.val());

    inputs.find('input:hidden').closest('.field').show();
    inputs.find('input:not(.'+value+')').closest('.field').hide();
  },
  bindUIActions: function() {
    var type = $(s.type_selector);
    type.on('change', function() {
      CarriageTypesVisibilityWidget.showHideInputs();
    });
  },
  _toUnderscore: function (string) {
    string = string || '';
    return string
        .replace(/([a-z\d])([A-Z])/g, '$1_$2')
        .toLowerCase();
  }
};
