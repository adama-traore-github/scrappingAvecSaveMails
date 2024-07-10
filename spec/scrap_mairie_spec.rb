
require 'rspec'
require_relative '../lib/app/scrap_mairie.rb'

RSpec.describe "scrap_mairie_ville" do
  it "returns a hash containing the city name and email" do
    mairie_hash = scrap_mairie_ville
    expect(mairie_hash).to be_a(Hash)
    expect(mairie_hash).to include(:ville, :email)
  end

  it "returns a non-empty city name and email" do
    mairie_hash = scrap_mairie_ville
    expect(mairie_hash[:ville]).not_to be_empty
    expect(mairie_hash[:email]).not_to be_empty
  end
end
