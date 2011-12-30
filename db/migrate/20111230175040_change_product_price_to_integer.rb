class ChangeProductPriceToInteger < ActiveRecord::Migration
  def self.up
    connection = ActiveRecord::Base.connection()
       # kill the weird chars in the string field
       connection.execute("UPDATE products SET price = REPLACE(REPLACE(price, ',', ''), '$', '')")

       # convert the string column into a decimal one
       change_table :products do |t|
         # adjust for your use case - this gives you values up to 9999999.99
         # if you need more, increase the 10
         t.change :price, :integer
       end
  end

  def self.down
    change_table :products do |t|
         t.column :price, :string, :limit => 10
       end
  end
end
