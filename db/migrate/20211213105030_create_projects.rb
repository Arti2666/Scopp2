class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :tag1
      t.string :tag2
      t.string :tag3

      t.timestamps
    end
  end
end
