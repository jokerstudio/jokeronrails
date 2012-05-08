class ChangeDataTypeForPostBody < ActiveRecord::Migration
  def up
  	change_table :posts do |t|
      t.change :body, :text
    end
  end

  def down
  end
end
