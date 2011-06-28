class CreateClients < ActiveRecord::Migration

  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :username
      t.string :password
      t.string :email
      t.integer :level
      t.integer :position

      t.timestamps
    end

    add_index :clients, :id

    load(Rails.root.join('db', 'seeds', 'clients.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "clients"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/clients"})
    end

    drop_table :clients
  end

end
