class AddFieldsToTransformArticles < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |t|
      t.references :legacy_article
      t.datetime :published_at
    end

    change_table :legacy_articles do |t|
      t.references :article
      t.datetime :transformed_at
    end
  end
end
