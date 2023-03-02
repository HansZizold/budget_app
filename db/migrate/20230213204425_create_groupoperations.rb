class CreateGroupoperations < ActiveRecord::Migration[7.0]
  def change
    create_table :groupoperations do |t|
      t.references :group, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
