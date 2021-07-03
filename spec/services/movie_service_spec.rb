require 'rails_helper'

RSpec.describe MovieService do
  subject(:movie_service) { MovieService.new }
  
  describe "#fetch_movies" do
    context "when given a user ID" do
      let(:user_id) { 12345 }
  
      it "returns an array of movies ids for that user" do
        movies = subject.fetch_movies(user_id)

        expect(movies).to be_an_instance_of(Array)
        expect(movies).to include(include(title: a_kind_of(String), image: a_kind_of(String), movieID: a_kind_of(Integer)))
        expect(movies.count).to be(100)
      end
    end
  end
end