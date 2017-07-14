var s,
  EditableTitleWidget = {

    settings: {
      control: '.field_edit_control',
      carr_inputs: '.types-inputs'
    },

    init: function() {
      s = this.settings;
      this.bindEvents()
    },
    bindEvents: function () {
      $(s.control).click(function () {
        var form_id = $(this).data('form-id');
        var form = $('#'+form_id);
        var title = $(this).closest('.editable_field_container').find('.editable_field');

        form.toggle();
        title.toggle();
        $(this).find('.icon').toggleClass('remove');

      });
    }
  };