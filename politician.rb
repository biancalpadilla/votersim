class Politician < Human

  attr_accessor :name, :party
  attr_reader :politician_id

  @@politician_id = 1

  def initialize(name, party, *rest)
    super(name)
    @party = party
    @politician_id = @@politician_id
    @@politician_id += 1
  end

end
