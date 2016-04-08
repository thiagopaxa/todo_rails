require 'rails_helper'

RSpec.describe "todos/index", type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        title: "Title",
        tasks_attributes: [{body: 'something'}],
        private: false,
        completed: false
      ),
      Todo.create!(
        title: "Title",
        tasks_attributes: [{body: 'something'}],
        private: false,
        completed: false
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 4
    assert_select "tr>td", text: false.to_s, count: 4
  end
end
