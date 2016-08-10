class CreateItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
    end
  end
end
