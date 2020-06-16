class AddUserIdToPdfs < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM pdfs;'
    add_reference :pdfs, :user, null: false, index: true
  end
  
  def down
    remove_reference :pdfs, :user, index: true
  end
end
