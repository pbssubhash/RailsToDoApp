class CreatePers < ActiveRecord::Migration
  def change
    create_table :pers do |t|
      t.string :person
      t.boolean :honest

      t.timestamps null: false
    end
  end
end
