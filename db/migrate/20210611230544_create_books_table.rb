class CreateBooksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
		  t.string :title
      t.string :author
      t.string :rating
    end
  end
end
