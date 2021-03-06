require 'spec_helper'

describe "Adding todo items" do
	let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
	let!(:todo_item) { todo_list.todo_items.create(content: "Milk") } 

	it "is successfull with valid content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Edit"
		end

		fill_in "Content", with: "Lots of milk"
		click_button "Save"
		expect(page).to have_content("Saved todo list item")
		todo_item.reload
		expect(todo_item.content).to eq("Lots of milk")
	end

	it "is unsuccessfull with no content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Edit"
		end

		fill_in "Content", with: ""
		click_button "Save"
		expect(page).to have_content("Content can't be blank")
		todo_item.reload
		expect(todo_item.content).to eq("Milk")
	end

	it "is unsuccessfull with not enough content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Edit"
		end

		fill_in "Content", with: "H"
		click_button "Save"
		expect(page).to have_content("Content is too short")
		todo_item.reload
		expect(todo_item.content).to eq("Milk")
	end

	


end
