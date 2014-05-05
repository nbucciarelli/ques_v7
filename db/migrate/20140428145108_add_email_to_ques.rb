class AddEmailToQues < ActiveRecord::Migration
  def change
    add_column :ques, :email, :string
  end
end
