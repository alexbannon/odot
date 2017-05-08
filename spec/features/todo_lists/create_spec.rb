require 'rails_helper'

describe "Creating Todo Lists" do
  def create_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list"

    visit "/todo_lists"
    click_link "Create New List"
    expect(page).to have_content("Title")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Todo list"
  end

  it 'redirects to the todo list show page on success' do
    create_todo_list
    expect(page).to have_content("My todo list")
  end

  it 'displays an error when the todo list has no title' do
    expect(TodoList.count).to eq(0)

    create_todo_list(title: "", description: "This is what I'm doing today")

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what I'm doing today")
  end

  it "displays an error when the todo list has too long of a description" do
    create_todo_list(description: "a" * 500)
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end

  it "displays an error when the todo list title is too long" do
    create_todo_list(title: "a" * 500)
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
  end
end
