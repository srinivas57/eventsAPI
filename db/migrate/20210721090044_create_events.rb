class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
    	t.string :event_type, null: false
      t.boolean :public, default: false
      t.references :repo, null: false
      t.references :actor, null: false, references: :users, foreign_key: { to_table: :users}
      t.timestamps
    end
  end
end
