class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :company_id
      t.boolean :company_admin_true_or_false
      t.string :photo

      t.timestamps
    end
  end
end
