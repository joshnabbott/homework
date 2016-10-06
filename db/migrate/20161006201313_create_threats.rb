class CreateThreats < ActiveRecord::Migration
  def change
    create_table :threats do |t|
      t.date :date
      t.integer :all_total
      t.integer :all_uniques
      t.integer :ips_total
      t.integer :ips_uniques
      t.integer :files_total
      t.integer :files_uniques
      t.integer :domains_total
      t.integer :domains_uniques
      t.integer :urls_total
      t.integer :urls_uniques

      t.timestamps null: false
    end
  end
end
