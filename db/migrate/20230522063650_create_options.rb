class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.text :content

      t.timestamps
    end
  end
end
