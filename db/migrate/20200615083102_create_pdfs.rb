class CreatePdfs < ActiveRecord::Migration[6.0]
  def change
    create_table :pdfs do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
