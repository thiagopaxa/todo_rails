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

  Todo.addFavorite = function() {
    var url = '/todos/' + $(this).data('id') + '/add_favorite',
      $that = $(this);

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',

      success: function(){
        $that.toggleClass('add-favorite remove-favorite')
          .children('.glyphicon')
          .toggleClass('glyphicon-star-empty glyphicon-star');
      },

      error: function(data) {
        console.error(data);
      }
    });
  };

  Todo.removeFavorite = function() {
    var url = '/todos/' + $(this).data('id') + '/remove_favorite',
      $that = $(this);

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',

      success: function(){
        $that.toggleClass('add-favorite remove-favorite')
          .children('.glyphicon')
          .toggleClass('glyphicon-star-empty glyphicon-star');
      },

      error: function(data) {
        console.error(data);
      }
    });
  };

  Todo.bindings = function(){
    $('.sign-out-btn').on('click', Todo.signUserOut);
    $('.todos-table').on('click', '.add-favorite',    Todo.addFavorite);
    $('.todos-table').on('click', '.remove-favorite', Todo.removeFavorite);
  };

  Todo.init = function(opts) {
    $.extend(true, Todo.configs, opts);
    Todo.bindings();
  };
})(window);