class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string         :post_code,      null:false
      t.integer        :prefecture_id,  null:false
      t.string         :city,           null:false
      t.string         :street_address, null:false
      t.string         :building            
      t.string         :phone,          null:false
      t.references     :order,          foreign_key: true , null: false 
      t.timestamps
    end
  end
end
