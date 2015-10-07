require './human.rb'
require './voter.rb'
require './politician.rb'
require './mainmenu.rb'
require './election.rb'

class World
  include Mainmenu
  include Election

  attr_accessor :voters, :politicians

  def initialize
    @voters, @politicians = [], []
  end

  def start
    main_menu
    report_winner
  end

end


world = World.new
world.start