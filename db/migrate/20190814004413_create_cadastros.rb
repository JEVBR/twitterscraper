class CreateCadastros < ActiveRecord::Migration[5.2]
  def change
    create_table :cadastros do |t|
      t.string :name
      t.string :url
      t.string :scraped_title
      t.string :scraped_description
      t.string :scraped_user
      t.string :short_url

      t.timestamps
    end
  end
end
