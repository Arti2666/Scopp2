class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user
      t.references :project

      t.timestamps
    end
  end
end
