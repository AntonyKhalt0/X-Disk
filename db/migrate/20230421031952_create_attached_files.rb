class CreateAttachedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :attached_files do |t|
      t.string :name
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
