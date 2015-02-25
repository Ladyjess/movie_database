require("spec_helper")

describe(Actor) do

  describe("#name") do
    it("returns the name") do
      actor = Actor.new({:name => "George Clooney", :id => nil})
      expect(actor.name()).to(eq("George Clooney"))
    end
  end

  describe("#id") do
    it("returns the id") do
      actor = Actor.new({:name => "George Clooney", :id => 1})
      expect(actor.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off with no actors") do
      expect(Actor.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a actor by its ID number") do
      test_actor = Actor.new({:name => "Brad Pitt", :id => nil})
      test_actor.save()
      test_actor2 = Actor.new({:name => "George Clooney", :id => nil})
      test_actor2.save()
      expect(Actor.find(test_actor2.id())).to(eq(test_actor2))
    end
  end

  describe("#==") do
    it("is the same actor if it has the same name and id") do
      actor = Actor.new({:name => "Brad Pitt", :id => nil})
      actor2 = Actor.new({:name => "Brad Pitt", :id => nil})
      expect(actor).to(eq(actor2))
    end
  end

  describe("#update") do
    it("lets you add a movie to an actor") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie.save()
      actor = Actor.new({:name => "George Clooney", :id => nil})
      actor.save()
      actor.update({:movie_ids => [movie.id()]})
      expect(actor.movies()).to(eq([movie]))
    end
  end

  describe("#movies") do
    it("returns all of the movies a particular actor has been in") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie.save()
      movie2 = Movie.new({:name => "Oceans Twelve", :id => nil})
      movie2.save()
      actor = Actor.new({:name => "George Clooney", :id => nil})
      actor.save()
      actor.update({:movie_ids => [movie.id()]})
      actor.update({:movie_ids => [movie2.id()]})
      expect(actor.movies()).to(eq([movie, movie2]))
    end
  end

  describe("#delete") do
    it("lets you delete an actor from the database") do
      actor = Actor.new({:name => "George Clooney", :id => nil})
      actor.save()
      actor2 = Actor.new({:name => "Brad Pitt", :id => nil})
      actor2.save()
      actor.delete()
      expect(Actor.all()).to(eq([actor2]))
    end
  end
end
