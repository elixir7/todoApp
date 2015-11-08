module TodoListHelpers
	#Imports into all todo_items so that you don't repeat yourself, DRY.
	def visit_todo_list(list)
		visit "/todo_lists"
		within dom_id_for(list) do
			click_link "List Items"
		end	
	end

end
