require 'rails_helper'

RSpec.describe MovieService do
  subject(:movie_service) { MovieService.new }
  
  describe "#fetch_movie_title" do
    let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
    let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }
    let(:url)    {"http://localhost:7002/"}
    
    context "when given a movie ID" do
      let(:movie_id) { 793 }

      it "returns a movie title for the given movie ID" do
        stubs.get(movie_id.to_s) do |env|
          expect(env.url.path).to eq('793')
          [
            200,
            { 'content-Type': 'title'},
            '{"title"}'
          ]
        end
        expect(subject.fetch_movie_title(movie_id)).to eq('Picture Perfect')
      end
    end
  end
  
  describe "#fetch_movie_image" do
    let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
    let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }
    let(:url)    {"http://localhost:7003/"}
    
    context "when given a movie ID" do
      let(:movie_id) { 793 }

      it "returns a movie title for the given movie ID" do
        stubs.get(movie_id.to_s) do |env|
          expect(env.url.path).to eq('793')
          [
            200,
            { 'content-Type': 'image'},
            '{"image"}'
          ]
        end
        expect(subject.fetch_movie_image(movie_id)).to match(/picture_perfect/)
      end
    end
  end
end