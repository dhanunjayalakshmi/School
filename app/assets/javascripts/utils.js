var StudentsDBUtils = {
  hide: function(eleId) {
    $(eleId).addClass('hidden');
  },
  show: function(eleId) {
    $(eleId).removeClass('hidden');
  },
  toggle: function(eleSelector) {
    $(eleSelector).toggleClass('hidden');
  }
};
