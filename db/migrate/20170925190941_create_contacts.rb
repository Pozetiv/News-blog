class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :body
      t.string :email
      t.string :other

      t.timestamps
    end
  end
end
