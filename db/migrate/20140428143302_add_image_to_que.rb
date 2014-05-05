class AddImageToQue < ActiveRecord::Migration
  def change
    add_attachment :ques, :image
  end
end
