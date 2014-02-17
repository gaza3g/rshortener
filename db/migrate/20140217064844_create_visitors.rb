class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ipaddr
      t.references :link, index: true

      t.timestamps
    end
  end
end
