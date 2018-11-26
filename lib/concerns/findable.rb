module Concerns::Findable

  def find_by_name (name) # finds name instance in @@all by name
    all.detect {|s| x.name == name}
  end

end   
