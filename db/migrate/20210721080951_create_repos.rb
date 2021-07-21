class CreateRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :repos do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
