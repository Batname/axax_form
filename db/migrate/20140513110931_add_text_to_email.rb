class AddTextToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :text, :text
  end
end
