module Mainmenu

  def gets_choice
    gets.chomp.upcase
  end

  def gets_name
    gets.split.map(&:capitalize).join(' ')
  end

  def main_menu
    puts "What would you like to do?", "(C)reate, (L)ist, (U)pdate, (V)ote" # Ask.main
    case gets_choice
      when "C", "CREATE" then create_menu
      when "L", "LIST" then list_menu
      when "U", "UPDATE" then update_menu
      when "V", "VOTE" then run_election
    else main_menu
    end
  end

  def create_menu
    puts "What would you like to create?","(P)olitician or (V)oter" # Ask.create
    case gets_choice
      when "P", "POLITICIAN" then create_politician_menu
      when "V", "VOTER" then create_voter_menu
      else create_menu
    end
  end

  def handle_politics_input(politics_input)
   case politics_input
     when "L", "LIBERAL" then "Liberal"
     when "C", "CONSERVATIVE" then "Conservative"
     when "T", "TEA PARTY" then "Tea Party"
     when "S", "SOCIALIST" then "Socialist"
     when "N", "NEUTRAL" then "Neutral"
     else create_menu
   end
  end

  def create_voter_menu
    puts "Voter Name?"
    name = gets_name

    puts "Politics?\n(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, (N)eutral"
    politics_input = gets_choice
    politics = handle_politics_input(politics_input)

    @voters << voter = Voter.new(name, politics)

    main_menu
  end

  def handle_party_input(party_input)
   case party_input
     when "R", "REPUBLICAN" then "Republican"
     when "D", "DEMOCRAT" then "Democrat"
     else create_politician_menu
   end
  end


  def create_politician_menu
    puts "Politician Name?"
    p name = gets_name

    puts "Party?\n(R)epublican or (D)emocrat?"
    party_input = gets_choice
    p party = handle_party_input(party_input)

    @politicians << politician = Politician.new(name, party)
    # p world.politicians = Politician.new(name, party)

    main_menu
  end

  def list_menu
    @politicians.each { |politician| puts "* Politician, #{politician.name}, #{politician.party}, Politician_ID: #{politician.politician_id}" }
    @voters.each { |voter| puts "* Voter, #{voter.name}, #{voter.politics}, Voter_ID: #{voter.voter_id}" }
    main_menu
  end

  def find_voter(name)
    @voters.select { |voter| voter.name == name }.first
  end

  def find_politician(name)
    @politicians.select { |politician| politician.name == name }.first
  end

  def update_menu
    puts "Name?"
    name = gets_name

    if @politicians.include? find_politician(name)
      politician = find_politician(name)
      update_politician(politician)
    elsif @voters.include? find_voter(name)
      p voter = find_voter(name)
      update_voter(voter)
    else
      "No Match Found!"
    end

    main_menu
  end


  def update_politician(politician)
    puts "New Politician Name?"
    new_name = gets_name

    puts "New Party?\n(R)epublican or (D)emocrat"
    new_party_input = gets_choice
    new_party = handle_party_input(new_party_input)

    politician.party = new_party
    politician.name = new_name

    main_menu
  end

  def update_voter(voter)
    puts "New Voter Name?"
    p new_name = gets_name

    puts "New Politics?\n(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, (N)eutral"
    p new_politics_input = gets_choice
    p new_politics = handle_politics_input(new_politics_input)

    p voter.politics = new_name
    p voter.name = new_politics

    main_menu
  end

end