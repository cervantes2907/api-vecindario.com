class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.string :email_user

      t.timestamps
    end
  end
end
