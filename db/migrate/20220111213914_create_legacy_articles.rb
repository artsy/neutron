class CreateLegacyArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :legacy_articles do |t|
      t.jsonb :data
      t.string :positron_id

      t.timestamps
    end
  end
end
