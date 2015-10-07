class Voter < Human

  attr_accessor :name, :politics
  attr_reader :voter_id

  @@voter_id = 1

  @@chance_of_republican = {
    "Tea Party" => 90,
    "Conservative" => 75,
    "Neutral" => 50,
    "Liberal" => 25,
    "Socialist" => 10
  }

  def initialize(name, politics, *rest)
    super(name)
    @politics = politics
    @voter_id = @@voter_id
    @@voter_id += 1
  end

  def vote(politicians)
   party = (rand(100) <= @@chance_of_republican[@politics]) ? "Republican" : "Democrat"
   candidates = politicians.select { |candidate| candidate.party == party} #.sample
   candidates.sample
  end

end