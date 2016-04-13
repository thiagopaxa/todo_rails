class TodoPresenter < Burgundy::Item
  def favorite_star(favorite_todo_ids)
    @favorite_todo_ids = favorite_todo_ids
    h.link_to 'javascript:void(0);', data: {id: item.id}, class: favorite_class do
      h.content_tag(:i, '', class: "glyphicon #{star_class}")
    end
  end

  private
    def star_class
      is_user_following ? "glyphicon-star" : "glyphicon-star-empty"
    end

    def favorite_class
      is_user_following ? "remove-favorite" : "add-favorite"
    end

    def is_user_following
      @favorite_todo_ids.include? item.id
    end
end