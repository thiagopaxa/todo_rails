;(function(root){
  'use strict';
  root.Todo = window.Todo || {};

  // Default configs
  // This will be overwrited in init if arguments are passed
  Todo.configs = {
    signOutPath         : '/users/sign_out'
  };

  // underscore template settings
  _.templateSettings = {
    interpolate : /\{\{(.+?)\}\}/g,
    evaluate    : /\{\{=(.+?)\}\}/g
  }

  Todo.init = function(opts) {
    $.extend(true, Todo.configs, opts);
    Todo.bindings();
  };

  Todo.signUserOut = function() {
    $.ajax({
      url: Todo.configs.signOutPath,
      type: 'DELETE',

      success: function(){
        window.location.reload();
      },

      error: function(data) {
        console.error(data);
      }
    });
  };

  Todo.addTask = function() {
    var templateHTML  = $('#task-field-template').html(),
      templateTask    = _.template(templateHTML),
      currentIndex    = $('.task-field').length;

    $(this).before(templateTask({index: currentIndex}));
  };

  Todo.bindings = function(){
    $('.sign-out-btn').on('click', Todo.signUserOut);
    $('.add-task-btn').on('click', Todo.addTask);
  };

})(window);