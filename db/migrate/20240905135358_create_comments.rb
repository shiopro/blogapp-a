class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :article, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
