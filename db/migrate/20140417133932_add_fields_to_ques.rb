class AddFieldsToQues < ActiveRecord::Migration
  def change
    add_column :ques ,:workflow_state, :string
  end
end
