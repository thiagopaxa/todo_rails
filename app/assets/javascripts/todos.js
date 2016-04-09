;(function(root){
  'use strict';
  root.Todo = window.Todo || {};

  Todo.signUserOut = function() {
    $.ajax({
      url: '/users/sign_out',
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

})(window);


$(function(){
  Todo.bindings();
});
