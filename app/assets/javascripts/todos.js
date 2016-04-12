;(function(root){
  'use strict';
  root.Todo = window.Todo || {};

  // Default configs
  // This will be overwrited in init if arguments are passed
  Todo.configs = {
    signOutPath: '/users/sign_out'
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

  Todo.bindings = function(){
    $('.sign-out-btn').on('click', Todo.signUserOut);
  };

  Todo.init = function(opts) {
    $.extend(true, Todo.configs, opts);
    Todo.bindings();
  };
})(window);