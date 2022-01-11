require 'rails_helper'

describe LegacyArticle do
  describe ".create_if_new" do
    context "without an oid" do
      let(:data) { { "title" => "Best Article" } }

      it "creates that legacy article" do
        expect {
          LegacyArticle.create_if_new(data)
        }.to change(LegacyArticle, :count).by(1)
      end
    end

    context "with an oid that is new" do
      let(:data) { { "_id" => { "$oid" => "new" }, "title" => "Best Article" } }

      it "creates that legacy article" do
        expect {
          LegacyArticle.create_if_new(data)
        }.to change(LegacyArticle, :count).by(1)
      end
    end

    context "with an oid that is not new" do
      let!(:legacy_article) { FactoryBot.create(:legacy_article, positron_id: "existing") }
      let(:data) { { "_id" => { "$oid" => legacy_article.positron_id }, "title" => "Best Article" } }

      it "does not create a legacy article" do
        expect {
          LegacyArticle.create_if_new(data)
        }.not_to change(LegacyArticle, :count)
      end
    end
  end
end
