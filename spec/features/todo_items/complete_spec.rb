require 'spec_helper'

describe "Adding todo items" do
	let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
	let!(:todo_item) { todo_list.todo_items.create(content: "Milk") } 

	it "is successfull when marking a single item complete" do
		expect(todo_item.complete_at).to be_nil
		visit_todo_list todo_list
		within dom_id


	end
end
